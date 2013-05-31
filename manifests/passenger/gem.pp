class rvm::passenger::gem($ruby_version, $version, $gemset) {
  if $gemset == '' {
    rvm_gem {
      "passenger":
        ensure       => $version,
        require      => Rvm_system_ruby["${ruby_version}"],
        ruby_version => $ruby_version;
    }
  }else{
    $ruby_version_with_gemset = "${ruby_version}@${gemset}"
    rvm_gem {
      "passenger":
        ensure       => $version,
        require      => [Rvm_system_ruby["${ruby_version}"], Rvm_gemset["${ruby_version_with_gemset}"]],
        ruby_version => $ruby_version_with_gemset;
    }
  }
}
