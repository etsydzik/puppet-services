class services {
  class { '::jdk_oracle':
    version        => '8',
    version_update => '131',
    version_build  => '11',
    version_hash   => 'd54c1d3a095b4ff2b6607d096fa80163',
    download_url   => 'http://download.oracle.com/otn-pub/java',
  }

  $spring =
    {
      rabbitmq => {
        amqpHost                  => 'localhost',
        amqpPort                  => '5672',
        amqpUser                  => 'nomisadmin',
        amqpPassword              => 'nomis',
        'topic.exchange'          => 'nomis.services',
        routingKey                => 'nomis_services',
        simulationResponseQueue   => 'simResponseQueue',
        optimizationResponseQueue => 'optResponseQueue',
        statusQueue               => 'nomisStatusQueue',
        configQueue               => 'nomisConfigQueue',
        logQueue                  => 'logmessages'
      }
    }

  $mongo =
    {
      database => {
        name => 'ns-common',
        url  => '127.0.0.1:27017',
      }
    }

  $com =
    {
      nomis =>
      {
        multiThreading         => true,
        timezone               => "Pacific/Pitcairn",
        showBanner             => true,

        'service.discovery.consul' =>
        {
          host => 'localhost',
          port => '8500'
        },

        nomisLogService        => {
          logNamePatterns => '/*opteng.txt,/*JNILog.csv,/*NagSetUpInfo.csv,optSolver/*.log',
          pathToMoveLogs  => '$current_dir/temp_naglogs'
        }
      }
    }

  file { '/etc/run.properties.json':
    ensure  => present,
    content => template('services/run.properties.erb'),
  }

  $service_name = 'simulation'

  file { "/etc/${service_name}.json":
    ensure  => present,
    content => template("services/${service_name}.json.erb"),
  }

}

# class services (
#   Pattern[/^.+$/] $jdk_version          = $::services::params::jdk_version,
#   $jdk_url                              = $::services::params::jdk_url,
#   $jdk_update                           = $::services::params::jdk_update,
#   $jdk_build                            = $::services::params::jdk_build,
#   $jdk_hash                             = $::services::params::jdk_hash,
# )inherits ::services::params {
#
# }

# class services (
#   Pattern[/^.+$/] $jdk_version          = $::services::params::jdk_version,
#   $jdk_url                              = $::services::params::jdk_url,
#   $jdk_update                           = $::services::params::jdk_update,
#   $jdk_build                            = $::services::params::jdk_build,
#   $jdk_hash                             = $::services::params::jdk_hash,
# ) inherits ::services::params {
#
# }



