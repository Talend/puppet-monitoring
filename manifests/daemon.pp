# Class: monitoring::daemon
#
define monitoring::daemon (
  $user,
  $version,
  $real_download_url,
  $download_extension = '',
  $os = 'linux',
  $arch = 'amd64',
  $service_ensure = 'running',
  $service_dependencies = '',
  $runtime_options = '',
) {

  $exporter_systemd_service_path = "/usr/lib/systemd/system/${name}.service"
  $exporter_systemd_environement_file_path = "/etc/sysconfig/${name}"

  $exporter_bin_dir = "/opt/${name}-${version}.${os}-${arch}"
  $exporter_bin_path = "${exporter_bin_dir}/${name}"

  user { $user :
    ensure  => 'present',
    comment => "User for ${name} Agent",
  }

  if $download_extension != '' {
    archive { "/tmp/${name}-${version}.${os}-${arch}.${download_extension}":
      ensure          => present,
      extract         => true,
      extract_path    => '/opt',
      source          => $real_download_url,
      checksum_verify => false,
      creates         => $exporter_bin_path,
      cleanup         => true,
      require         => User[$user],
    }
  } else {
    file { $exporter_bin_dir:
      ensure  => directory,
      owner   => $user,
      group   => $user,
      mode    => '0755',
      require => User[$user],
    }

    archive { $exporter_bin_path:
      ensure          => present,
      source          => $real_download_url,
      checksum_verify => false,
      user            => $user,
      group           => $user,
      require         => File[$exporter_bin_dir],
    }

    file { $exporter_bin_path:
      ensure  => present,
      mode    => '0755',
      require => Archive[$exporter_bin_path],
    }
  }

  file { $exporter_systemd_service_path:
    ensure  => 'present',
    content => template('monitoring/generic.service.erb'),
    owner   => $user,
    group   => $user,
    require => User[$user],
  }

  file { $exporter_systemd_environement_file_path:
    ensure  => 'present',
    content => template('monitoring/generic.env.erb'),
    owner   => $user,
    group   => $user,
    require => User[$user],
  }

  service { "${name}.service":
    ensure  => $service_ensure,
    enable  => true,
    require => File[$exporter_systemd_service_path, $exporter_systemd_environement_file_path],
  }
}