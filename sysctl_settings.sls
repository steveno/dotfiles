kernel.randomize_va_space:
  sysctl.present:
    - value: 1

net.ipv4.conf.all.rp_filter:
  sysctl.present:
    - value: 1

net.ipv4.conf.all.accept_source_route:
  sysctl.present:
    - value: 0

net.ipv4.icmp_echo_ignore_broadcasts:
  sysctl.present:
    - value: 1

net.ipv4.conf.all.log_martians:
  sysctl.present:
    - value: 1
