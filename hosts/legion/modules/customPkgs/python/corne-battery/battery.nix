{ pkgs, ... }: pkgs.writers.writePython3Bin "battery" { libraries = with pkgs;[ python311Packages.dbus-next python311Packages.anyio ]; }
  ''
    # flake8: noqa
    from dbus_next.aio import MessageBus
    from dbus_next.constants import BusType
    import asyncio
    BLUEZ = "org.bluez"
    # replace hci0 with your bluetooth
    # adapter name and FF_FF_FF_FF_FF_FF with your keyboard address
    BLUEZ_PATH = "/org/bluez/hci0/dev_CD_C7_B9_9F_FB_FC"
    GATT_SERVICE = 'org.bluez.GattService1'
    GATT_CHAR = 'org.bluez.GattCharacteristic1'
    GATT_CHAR_DESCR = 'org.bluez.GattDescriptor1'
    BATTERY_UUID = "0000180f-0000-1000-8000-00805f9b34fb"
    BATTERY_LEVEL_UUID = "00002a19-0000-1000-8000-00805f9b34fb"
    BATTERY_USER_DESC = "00002901-0000-1000-8000-00805f9b34fb"
    DBUS_PROP = "org.freedesktop.DBus.Properties"


    loop = asyncio.get_event_loop()


    async def main():
        bus = await MessageBus(bus_type=BusType.SYSTEM).connect()
        # the introspection xml would normally be included in your project, but
        # this is convenient for development
        introspection = await bus.introspect(BLUEZ, BLUEZ_PATH)

        device = bus.get_proxy_object(BLUEZ, BLUEZ_PATH, introspection)

        for svc in device.child_paths:
            intp = await bus.introspect(BLUEZ, svc)
            proxy = bus.get_proxy_object(BLUEZ, svc, intp)
            intf = proxy.get_interface(GATT_SERVICE)
            if BATTERY_UUID == await intf.get_uuid():
                for char in proxy.child_paths:
                    intp = await bus.introspect(BLUEZ, char)
                    proxy = bus.get_proxy_object(BLUEZ, char, intp)
                    intf = proxy.get_interface(GATT_CHAR)
                    level = int.from_bytes(await intf.call_read_value({}))
                    if BATTERY_LEVEL_UUID == await intf.get_uuid():
                        # props = proxy.get_interface(DBUS_PROP)
                        for desc in proxy.child_paths:
                            intp = await bus.introspect(BLUEZ, desc)
                            proxy = bus.get_proxy_object(BLUEZ, desc, intp)
                            intf = proxy.get_interface(GATT_CHAR_DESCR)
                            name = "Main"
                            if BATTERY_USER_DESC == await intf.get_uuid():
                                name = bytearray(await intf.call_read_value({})).decode()
                        print(name + ": ", str(level))

    loop.run_until_complete(main())
  ''

