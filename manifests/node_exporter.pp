# Class: monitoring::node_exporter
#
# Parameters:
class monitoring::node_exporter (
  $user    = 'node_exporter',
  $version = '0.15.2',
  $exporter_name = 'node_exporter',
  $service_ensure = 'running',
) {

  monitoring::daemon { $exporter_name:
    user               => $user,
    version            => $version,
    download_extension => 'tar.gz',
    real_download_url  => "https://github.com/prometheus/${exporter_name}/releases/download/v${version}/${exporter_name}-${version}.linux-amd64.tar.gz",
    runtime_options    => '--collector.textfile.directory /var/lib/node_exporter/textfile_collector --collector.systemd',
  }
}