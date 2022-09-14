-- Capture real implementation of function that sets signs
local orig_set_signs = vim.diagnostic.set_signs
local set_signs_limited = function(diagnostics, bufnr, client_id, sign_ns, opts)
	-- original func runs some checks, which I think is worth doing
	-- but maybe overkill
	if not diagnostics then
		diagnostics = diagnostic_cache[bufnr][client_id]
	end

	-- early escape
	if not diagnostics then
		return
	end

	-- Work out max severity diagnostic per line
	local max_severity_per_line = {}
	for _, d in pairs(diagnostics) do
		if max_severity_per_line[d.range.start.line] then
			local current_d = max_severity_per_line[d.range.start.line]
			if d.severity < current_d.severity then
				max_severity_per_line[d.range.start.line] = d
			end
		else
			max_severity_per_line[d.range.start.line] = d
		end
	end

	-- map to list
	local filtered_diagnostics = {}
	for i, v in pairs(max_severity_per_line) do
		table.insert(filtered_diagnostics, v)
	end

	-- call original function
	orig_set_signs(filtered_diagnostics, bufnr, client_id, sign_ns, opts)
end
vim.diagnostic.set_signs = set_signs_limited
