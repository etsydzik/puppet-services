class { "services":
  # parameter1 => value1,
}

# class services(
#   $jdk_version = $::services::jdk_version,
#   $jdk_update  = $::services::jdk_update,
#   $jdk_build   = $::services::jdk_build,
#   $jdk_hash    = $::services::jdk_hash,
#   $jdk_url     = $::services::jdk_url,
# ){
#   class { '::jdk_oracle':
#     version        => $jdk_version,
#     version_update => $jdk_update,
#     version_build  => $jdk_build,
#     version_hash   => $jdk_hash,
#     download_url   => $jdk_url,
#   }
# }