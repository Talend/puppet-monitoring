# Class: monitoring::node_exporter
#
# Parameters:
class monitoring::node_exporter (
  $version,
  $user    = 'node_exporter',
  $exporter_name = 'node_exporter',
  $service_ensure = 'running',
  $port = 9100,
) {

  monitoring::daemon { $exporter_name:
    user               => $user,
    version            => $version,
    download_extension => 'tar.gz',
    real_download_url  => "https://github.com/prometheus/${exporter_name}/releases/download/v${version}/${exporter_name}-${version}.linux-amd64.tar.gz",
    runtime_options    => "-web.listen-address=\":${port}\" \
                           --collector.textfile.directory /var/lib/node_exporter/textfile_collector \
                           --collector.systemd",
  }
}