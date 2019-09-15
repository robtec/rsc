# Secure RouterOS

/ip service set winbox address=192.168.8.0/24

/ip service set ssh address=192.168.8.0/24

/ip service set www address=192.168.8.0/24

/ip dns set allow-remote-requests=no

/ip ssh set strong-crypto=yes