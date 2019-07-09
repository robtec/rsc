:global METRICSENDPOINT
:global SITE

:global ACCESS

:local lteInfo [:put [/interface lte info lte1 once as-value]] 
:local rsrp ($lteInfo->"rsrp")
:local rsrq ($lteInfo->"rsrq")
:local rssi ($lteInfo->"rssi")
:local sinr ($lteInfo->"sinr")

:if ([:len $rsrq] > 0) do={
    :local dRsrq ($rsrq / 10)
    /tool fetch http-method=post http-data="signal,site=$SITE,access=lte,type=rsrp value=$rsrp" url=$METRICSENDPOINT;
    /tool fetch http-method=post http-data="signal,site=$SITE,access=lte,type=rsrq value=$dRsrq" url=$METRICSENDPOINT;
    /tool fetch http-method=post http-data="signal,site=$SITE,access=lte,type=sinr value=$sinr" url=$METRICSENDPOINT;
    :set ACCESS "lte"
} else {
    /tool fetch http-method=post http-data="signal,site=$SITE,access=3g,type=rssi value=$rssi" url=$METRICSENDPOINT;
    :set ACCESS "3g"
}