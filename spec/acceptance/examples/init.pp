user {'docker':}

class { 'monitoring::node_exporter': }
class { 'monitoring::cadvisor': }