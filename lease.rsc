:local hostname $"lease-hostname"

:if ($leaseBound = "1") do={
    :log warning "$hostname assigned $leaseActIP"
} else={
    :log warning "$hostname unassigned $leaseActIP"
}