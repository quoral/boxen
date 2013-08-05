class people::schwomp::applications{
    include alfred
    include python
    include chrome::canary
    include chrome
    include alfred
    include shortcat
    include java
    include android::sdk
    include android::platform_tools
    include sublime_text_2
    include iterm2::dev
    include ohmyzsh
    include spotify
    include firefox
    class fishshell{ #Horribly bloated way of doing this. May get around to do a proper boxen thingy later.
        exec { 'curl http://fishshell.com/files/2.0.0/fish.pkg -o /var/tmp/fish.pkg':
            creates => '/var/tmp/fish.pkg'
        }
        package{ 'fishshell':
            source      =>  '/var/tmp/fish.pkg',
            provider    =>  apple,
            ensure      =>  present
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
    #file_line { 'add zsh to /etc/shells':
    #    path    => '/etc/shells',
    #    line    => "${boxen::config::homebrewdir}/bin/zsh",
    #    require => Package['fishshell'],
    #}
    class { 'intellij':
        edition => 'community'
    }
}
