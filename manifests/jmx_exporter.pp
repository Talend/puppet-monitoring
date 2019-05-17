# Class: monitoring::node_exporter
#
# Parameters:
class monitoring::jmx_exporter (
  $version = '0.3.1',
  $user    = 'jmx_exporter',
  $exporter_name = 'jmx_exporter',
  $jmx_exporter_service = 'default',
) {

  $exporter_dir = "/opt/${exporter_name}-${version}"
  $config_file = "${exporter_dir}/${jmx_exporter_service}.yaml"

  include ::wget

  user { $user :
    ensure => 'present',
  }

  file { $exporter_dir:
    ensure  => directory,
    owner   => $user,
    group   => $user,
    mode    => '0755',
    require => User[$user],
  }

  wget::fetch{ "jmx_prometheus_javaagent-${version}.jar":
    source      => "https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/${version}/jmx_prometheus_javaagent-${version}.jar",
    destination => "${exporter_dir}/jmx_prometheus_javaagent-${version}.jar",
    require     => File[$exporter_dir],
  }

  file { $config_file:
    ensure => 'present',
    source => "puppet:///modules/monitoring/${jmx_exporter_service}.yaml",
    owner  => $user,
    group  => $user,
    mode   => '0644',
  }

}
