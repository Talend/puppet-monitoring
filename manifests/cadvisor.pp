#
# Class: monitoring::cadvisor
#
class monitoring::cadvisor (
  $version,
  $user    = 'cadvisor',
  $exporter_name = 'cadvisor',
  $service_ensure = 'running',
  $port = 9500,
) {

  monitoring::daemon { $exporter_name:
    user                 => $user,
    user_extra_groups    => 'docker',
    version              => $version,
    runtime_options      => "--port ${port}",
    real_download_url    => "https://github.com/google/cadvisor/releases/download/v${version}/cadvisor",
    service_ensure       => $service_ensure,
    service_dependencies => 'docker.service',
    require              => User['docker'],
  }
}
