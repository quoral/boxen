class people::schwomp::windowmanager{
    include keyremap4macbook
    include pckeyboardhack
    class tranquil{ #Dirtydirtydirty
          exec { "wget -O /var/tmp/tranquil.pkg http://cl.ly/OCGB/download/tranquil.pkg ":
          creates => "/var/tmp/tranquil.pkg",
          require => Package[wget]
        }
        package{ 'tranquil':
          source => "/var/tmp/tranquil.pkg",
          provider => apple,
          ensure => present
        }
    }
    class xnomad{
      require tranquil
       package{ 'xnomad':
         ensure => installed,
         provider => compressed_app,
         source => 'http://tengil.eu/xnomad/Xnomad.zip',
       }
    }
    include xnomad
    package{ 'shadowkiller':
      ensure => installed,
      provider => compressed_app,
      source => 'http://tengil.eu/xnomad/ShadowKiller.zip'
    }
}
