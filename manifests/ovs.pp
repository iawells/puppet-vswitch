class vswitch::ovs {
  case $::osfamily {
    Debian: {
      package {["openvswitch-switch", "openvswitch-datapath-dkms"]: ensure => present}
    }
    Ubuntu: {
      package {["openvswitch-switch", "openvswitch-datapath-dkms"]: ensure => present}
    }
  }

  service {"openvswitch-switch":
    ensure      => running,
    enable      => true,
    #hasstatus   => true,
    require	 => Package["openvswitch-switch", "openvswitch-datapath-dkms"],
    #status      => "/etc/init.d/openvswitch-switch status",
  }
}
