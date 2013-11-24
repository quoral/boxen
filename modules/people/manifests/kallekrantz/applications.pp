class people::kallekrantz::applications{
    include alfred
    include dropbox
    include python
    include brewcask
    include chrome::canary
    include chrome
    include alfred
    include shortcat
    include java
    include android::sdk
    include android::platform_tools
    include iterm2::dev
    include spotify
    include firefox
    class fishshell{ #Horribly bloated way of doing this. May get around to do a proper boxen thingy later.
      
        exec { 'curl http://fishshell.com/files/2.0.0/fish.pkg -o /var/tmp/fish.pkg':
            creates => '/var/tmp/fish.pkg'
        }
        package{ 'fishshell':
            source      =>  '/var/tmp/fish.pkg',
            provider    =>  apple,
            ensure      =>  installed
        }
        file_line { 'add fishshell to /etc/shells':
            path    => '/etc/shells',
            line    => "/usr/local/bin/fish",
            require => Package['fishshell'],
        }
        osx_chsh{ $::luser:
            shell => "/usr/local/bin/fish",
            require => File_line['add fishshell to /etc/shells'],
        }
    }
    include fishshell
    #I want to do this curl -s http://emacsformacosx.com/atom/daily | head -c 1000 | grep 'dmg\"/>$' | tail -c 87 | head -c 83 | xargs wget -O Emacs.dmg
    class emacs{ #I silently hate myself forever
      $emacs_version = 'Emacs-2013-08-08-113753-universal-10.6.8' 
      package{ 'emacs.app':
        source => "http://emacsformacosx.com/emacs-builds/${emacs_version}.dmg",
        provider => appdmg,
        ensure => installed
      }
      package{'emacs':
         ensure => installed,
      }
    }
    include emacs
    class vcprompt{
      file{ "/Users/${boxen_user}/bin":
        ensure => directory,
      }
      $command ="curl -sL https://github.com/djl/vcprompt/raw/master/bin/vcprompt > /Users/${boxen_user}/bin/vcprompt" 
      exec{$command:
        creates => "/Users/${boxen_user}/bin/vcprompt",
        require => File["/Users/${boxen_user}/bin"]
      }
      $chmodit = "chmod 755 /Users/${boxen_user}/bin/vcprompt"
      exec{$chmodit:
        require => Exec[$command]
      }
    }
    include vcprompt
    package{ 'viber':
      source => "http://download.viber.com/desktop/mac/Viber.dmg",
      provider => appdmg,
      ensure => installed
    }
    include gdb
    package{ 'mplayer':}
}
