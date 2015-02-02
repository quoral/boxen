class people::kallekrantz::applications{
  include alfred
  include skype
  include dropbox
  include python
  include brewcask
  include chrome::canary
  include java
  include android::sdk
  include android::platform_tools
  include android::ndk
  include iterm2::dev
  include iterm2::colors::zenburn
  include spotify
  include firefox
  include virtualbox
  include packer
  include vagrant
  include silverlight
  include onyx
  include wkhtmltopdf

  package{'node':}
  package{'phantomjs':}

  #Shell stuff
  include zsh
  include ohmyzsh
  
  #Editor stuff

  include sublime_text_3
  include sublime_text_3::package_control

  package { 'emacs':
    install_options => [
      '--cocoa',
      '--HEAD'
    ]
  }
  
  exec { "brew linkapps emacs":
   creates => "/Applications/Emacs.app",
   require => Package["emacs"]
  }
  
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
  include fonts
  include vcprompt

  package{ 'vlc' :
    provider => brewcask,
    ensure => installed
  }
  include gdb
  package{ 'gcc49': }
  package{ 'mplayer': }
  package{ 'unrar': }
  package{ 'cmake': }
  package{ 'ctags': }
}
