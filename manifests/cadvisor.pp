# Class: monitoring::node_exporter
#
# Parameters:
class monitoring::cadvisor (
  $user    = 'cadvisor',
  $version = '0.29.0',
  $exporter_name = 'cadvisor',
  $service_ensure = 'running',
) {

  monitoring::daemon { $exporter_name:
    user              => $user,
    version           => $version,
    runtime_options   => '--port 9500',
    real_download_url => "https://github.com/google/cadvisor/releases/download/v${version}/cadvisor",
    service_ensure    => $service_ensure,
  }
}