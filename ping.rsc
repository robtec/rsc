:local HOST "1.1.1.1"
:local PINGCOUNT "10"
:local PINGMINIMUM "5"
:local INT "lte1"
:local DELAY "3s"
:local DOWNLIMIT "2"

:global UPCOUNT
:global DOWNCOUNT

:if ([/ping $HOST interval=1 count=$PINGCOUNT] < $PINGMINIMUM) do={

    :log error "ping $HOST failed, reseting $INT interface..."
    :set DOWNCOUNT ($DOWNCOUNT + 1)
    :set UPCOUNT 0
    /interface disable $INT
    :log error "$INT is now disabled, waiting $DELAY ..."
    :delay $DELAY
    /interface enable $INT
    :delay $DELAY
    :log warning "$INT is now enabled"
} else {
    :set UPCOUNT ($UPCOUNT + 1)
    :set DOWNCOUNT 0
}

:delay 10s

:if ($DOWNCOUNT >= $DOWNLIMIT) do={
    :log error "Down limit exceeded - power cycling LTE chip (usb)"
    /system routerboard usb power-reset duration=5
    :set DOWNCOUNT 0
}