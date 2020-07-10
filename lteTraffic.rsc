:local METRICSENDPOINT 
:local SITE [:put [system identity get name]]
:local RXBYTES [:put [interface get lte1 rx-byte]]
:local TXBYTES [:put [interface get lte1 tx-byte]]

/tool fetch http-method=post http-data="traffic,site=$SITE,type=rx value=$RXBYTES" url=$METRICSENDPOINT;

/tool fetch http-method=post http-data="traffic,site=$SITE,type=tx value=$TXBYTES" url=$METRICSENDPOINT;
