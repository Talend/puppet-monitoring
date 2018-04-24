# Class: monitoring::node_exporter
#
# Parameters:
class monitoring::mongodb_exporter (
  $version,
  $user    = 'mongodb_exporter',
  $exporter_name = 'mongodb_exporter',
  $service_ensure = 'running',
  $port = 9216,
  $mongodb_url = 'mongodb://localhost:27017'
) {

  monitoring::daemon { $exporter_name:
    user               => $user,
    version            => $version,
    download_extension => 'tar.gz',
    real_download_url  => "https://github.com/percona/${exporter_name}/releases/download/v${version}/${exporter_name}-${version}.linux-amd64.tar.gz",
    runtime_options    => "-web.listen-address :${port}",
    envs               => {'MONGODB_URL' => $mongodb_url},
  }
}