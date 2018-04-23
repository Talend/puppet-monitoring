#
# Class: monitoring::cadvisor
#
class monitoring::cadvisor (
  $version,
  $version_checksum,
  $user    = 'cadvisor',
  $exporter_name = 'cadvisor',
  $service_ensure = 'running',
  $port = 9500,
) {

  monitoring::daemon { $exporter_name:
    user                 => 'root',
    version              => $version,
    checksum_verify      => true,
    checksum_type        => 'sha256',
    checksum             => $version_checksum,
    runtime_options      => "--port ${port}",
    real_download_url    => "https://github.com/google/cadvisor/releases/download/v${version}/cadvisor",
    service_ensure       => $service_ensure,
    service_dependencies => 'docker.service',
  }
}

#SHA256: f5c8deb31eb12cae38007f0f4a208e0b9ba2b2ad6a1c9610b32d113221880d4e