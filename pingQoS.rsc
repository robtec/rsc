:local METRICSENDPOINT
:local SITE [:put [system identity get name]]

:local avgRtt

/tool flood-ping count=10 size=56 1.1.1.1 do={:set avgRtt $"avg-rtt"}

/tool fetch http-method=post http-data="ping,site=$SITE,access=lte,type=avg value=$avgRtt" url=$METRICSENDPOINT;