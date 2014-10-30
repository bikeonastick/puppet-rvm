class rvm::system($version='latest') {
  exec { 'system-rvm':
    path    => '/usr/bin:/usr/sbin:/bin',
    command => "bash -c '/usr/bin/curl -sSL https://get.rvm.io -o /tmp/rvm-installer && \
                chmod +x /tmp/rvm-installer && \
                rvm_bin_path=/usr/local/rvm/bin rvm_man_path=/usr/local/rvm/man /tmp/rvm-installer --version ${version} && \
                rm /tmp/rvm-installer'",
    creates => '/usr/local/rvm/bin/rvm',
    require => [
      Class['rvm::dependencies'],
    ],
  }
}
