:global METRICSENDPOINT
:global SITE

:local lteInfo [:put [/interface lte info lte1 once as-value]] 
:local rsrp ($lteInfo->"rsrp")
:local rsrq ($lteInfo->"rsrq")
:local rssi ($lteInfo->"rssi")
:local sinr ($lteInfo->"sinr")

:if ([:len $rsrp] > 0) do={
    :put $rsrp
    :put $rsrq
    /tool fetch http-method=post http-data="signal,site=$SITE,access=lte,type=rsrp value=$rsrp" url=$METRICSENDPOINT;
    /tool fetch http-method=post http-data="signal,site=$SITE,access=lte,type=rsrq value=$rsrq" url=$METRICSENDPOINT;
    /tool fetch http-method=post http-data="signal,site=$SITE,access=lte,type=sinr value=$sinr" url=$METRICSENDPOINT;
}

:if ([:len $rssi] > 0) do={
    /tool fetch http-method=post http-data="signal,site=$SITE,access=3g,type=rssi value=$rssi" url=$METRICSENDPOINT;
}