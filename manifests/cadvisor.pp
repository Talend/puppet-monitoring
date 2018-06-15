#
# Class: monitoring::cadvisor
#
class monitoring::cadvisor (
  $version,
  $version_checksum,
  $user    = 'cadvisor',
  $exporter_name = 'cadvisor',
  $service_ensure = 'running',
  $service_enable = true,
  $port = 9500,
) {

  monitoring::daemon { $exporter_name:
    user                 => 'root',
    version              => $version,
    checksum_verify      => true,
    checksum_type        => 'sha256',
    checksum             => $version_checksum,
    runtime_options      => "--port ${port} --docker_only=true",
    real_download_url    => "https://github.com/google/cadvisor/releases/download/v${version}/cadvisor",
    service_ensure       => $service_ensure,
    service_enable       => $service_enable,
    service_dependencies => 'docker.service',
  }
}
