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
  $service_enable = true,
  $service_dependencies = '',
  $runtime_options = '',
  $checksum_verify = false,
  $checksum      = '',
  $checksum_type = 'sha512',
  $envs = {}
) {

  $exporter_systemd_service_path = "/usr/lib/systemd/system/${name}.service"
  $exporter_systemd_environement_file_path = "/etc/sysconfig/${name}"

  $exporter_bin_dir = "/opt/${name}-${version}.${os}-${arch}"
  $exporter_bin_path = "${exporter_bin_dir}/${name}"

  if !defined(Package['wget']) {
    ensure_packages(['wget'])
  }

  user { $user :
    ensure => 'present',
  }

  if $download_extension != '' {
    wget::fetch{ "/tmp/${name}-${version}.${os}-${arch}.${download_extension}":
      source      => $real_download_url,
      destination => "/tmp/${name}-${version}.${os}-${arch}.${download_extension}",
      before      => Exec["${name}-untar"],
    }

    exec{ "${name}-untar":
      command => "tar zxf /tmp/${name}-${version}.${os}-${arch}.${download_extension} --directory /opt",
      creates => $exporter_bin_path,
      path    => ['/bin','/usr/bin'],
      before  => Service["${name}.service"],
    }
  } else {
    file { $exporter_bin_dir:
      ensure  => directory,
      owner   => $user,
      group   => $user,
      mode    => '0755',
      require => User[$user],
    }

    wget::fetch{ $exporter_bin_path:
      source      => $real_download_url,
      destination => $exporter_bin_path,
    }

    file { $exporter_bin_path:
      ensure  => present,
      mode    => '0755',
      require => Wget::Fetch[$exporter_bin_path],
      before  => Service["${name}.service"],
    }
  }

  file { $exporter_systemd_service_path:
    ensure  => 'present',
    content => template('monitoring/generic.service.erb'),
    owner   => $user,
    group   => $user,
    require => User[$user],
    notify  => Service["${name}.service"],
  }

  file { $exporter_systemd_environement_file_path:
    ensure  => 'present',
    content => template('monitoring/generic.env.erb'),
    owner   => $user,
    group   => $user,
    require => User[$user],
    notify  => Service["${name}.service"],
  }

  service { "${name}.service":
    ensure  => $service_ensure,
    enable  => $service_enable,
    require => File[$exporter_systemd_service_path, $exporter_systemd_environement_file_path],
  }
}
