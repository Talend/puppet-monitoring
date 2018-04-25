user {'docker':}

class { 'monitoring::node_exporter': }
class { 'monitoring::cadvisor': }
class { 'monitoring::mongodb_exporter': }
