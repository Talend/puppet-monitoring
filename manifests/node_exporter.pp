# Class: monitoring::node_exporter
#
# Parameters:
class monitoring::node_exporter (
  $user    = 'node_exporter',
  $version = '0.15.2',
  $download_extension = 'tar.gz',
  $exporter_name = 'node_exporter',
  $os = 'linux',
  $arch = 'amd64',
  $service_ensure = 'running'
) {

  $exporter_bin_dir = "/opt/${exporter_name}-${version}.${os}-${arch}"
  $exporter_systemd_service_path = "/usr/lib/systemd/system/${exporter_name}.service"
  $exporter_systemd_environement_file_path = "/etc/sysconfig/${exporter_name}"

  user { $user :
    ensure  => 'present',
    comment => "User for ${exporter_name} Agent",
  }

  archive { "/tmp/${exporter_name}-${version}.${os}-${arch}.${download_extension}":
    ensure          => present,
    extract         => true,
    extract_path    => '/opt',
    source          => "https://github.com/prometheus/${exporter_name}/releases/download/v${version}/${exporter_name}-${version}.${os}-${arch}.${download_extension}",
    checksum_verify => false,
    creates         => $exporter_bin_dir,
    cleanup         => true,
  }


  file { $exporter_systemd_service_path:
    ensure  => 'present',
    content => template("monitoring/${exporter_name}.service.erb"),
    owner   => $user,
    group   => $user,
    require => User[$user],
  }

  file { $exporter_systemd_environement_file_path:
    ensure  => 'present',
    content => template("monitoring/${exporter_name}.env.erb"),
    owner   => $user,
    group   => $user,
    require => User[$user],
  }

  service { "${exporter_name}.service":
    ensure  => $service_ensure,
    enable  => true,
    require => File[$exporter_systemd_service_path, $exporter_systemd_environement_file_path],
  }
}