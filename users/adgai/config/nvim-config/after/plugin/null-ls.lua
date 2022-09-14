local null_ls = require("null-ls")

local helpers = require("null-ls.helpers")

local markdownlint = {
	method = null_ls.methods.DIAGNOSTICS,
	filetypes = { "javascript" },
	name = "jshint",
	-- null_ls.generator creates an async source
	-- that spawns the command with the given arguments and options
	generator = null_ls.generator({
		command = "jshint",
		-- args = { "--stdin" },
		args = { "--reporter", "unix", "--extract", "auto" },
		--reporter  unix  --extract  auto
		to_stdin = false,
		from_stderr = true,
		-- choose an output format (raw, json, or line)
		format = "line",
		check_exit_code = function(code, stderr)
			local success = code <= 1

			if not success then
				-- can be noisy for things that run often (e.g. diagnostics), but can
				-- be useful for things that run on demand (e.g. formatting)
				print(stderr)
			end

			return success
		end,
		-- use helpers to parse the output from string matchers,
		-- or parse it manually with a function
		on_output = helpers.diagnostics.from_patterns({
			{
				pattern = [[%f:%l:%c: %m]],
				groups = { "buf", "row", "col", "msg" },
			},
			{
				pattern = [[:(%d+):(%d+) [%w-/]+ (.*)]],
				groups = { "row", "col", "message" },
			},
			{
				pattern = [[:(%d+) [%w-/]+ (.*)]],
				groups = { "row", "message" },
			},
		}),
	}),
}

null_ls.register(markdownlint)

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint.with({
			prefer_local = "node_modules/.bin",
		}),
		null_ls.builtins.formatting.google_java_format.with({
			extra_args = { "--aosp" },
		}),

		null_ls.builtins.diagnostics.write_good,
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.prettier.with({
			prefer_local = "node_modules/.bin",
		}),
		null_ls.builtins.completion.spell,
		null_ls.builtins.diagnostics.ansiblelint,
	},
})
