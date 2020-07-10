:local NUMBER [:put [tool sms get allowed-number]]
:local VERSION [:put [system resource get version]]
:local UPTIME [:put [system resource get uptime]]
:local LINKUP [:put [interface get lte1 last-link-up-time]]
:local LINKDOWNS [:put [interface get lte1 link-downs]]

:local MESSAGE "version: $VERSION\n- uptime: $UPTIME\n- link up: $LINKUP\n- link dw: $LINKDOWNS"


/tool sms send message=$MESSAGE phone-number=$NUMBER lte1
