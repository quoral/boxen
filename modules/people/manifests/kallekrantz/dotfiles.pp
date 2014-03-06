class people::kallekrantz::dotfiles{
    $home = "/Users/${::boxen_user}"
    $dotfiles_dir = "${boxen::config::srcdir}/dotfiles"
    $emacs_dir = "${boxen::config::srcdir}/emacs.d"
    repository { $emacs_dir:
      source => "${::github_login}/emacs.d"
    }
    file { "${home}/.emacs.d":
      ensure => link,
      target => $emacs_dir
    }

    repository { $dotfiles_dir:
      source => "${::github_login}/dotfiles"
    }

    file { "${home}/.vim":
      ensure  => link,
      target  => "${dotfiles_dir}/vim",
      require => Repository[$dotfiles_dir]
    }

    file { "${home}/.zshrc":
      ensure  => link,
      target  => "${dotfiles_dir}/zshrc",
      require => Repository[$dotfiles_dir]
    }

    file { "${home}/.vimrc":
      ensure  => link,
      target  => "${dotfiles_dir}/vimrc",
      require => Repository[$dotfiles_dir]
    } 
    file { "${home}/.slate":
      ensure  => link,
      target  => "${dotfiles_dir}/slate",
      require => Repository[$dotfiles_dir]
    }
    file { "${home}/.slate.js":
      ensure  => link,
      target  => "${dotfiles_dir}/slate.js",
      require => Repository[$dotfiles_dir]
    }
    file { "${home}/.amethyst":
    ensure => link,
    target => "${dotfiles_dir}/amethyst",
    require => Repository[$dotfiles_dir]
    }
    
    file { "${home}/.config":
      ensure  => link,
      target  => "${dotfiles_dir}/config",
      require => Repository[$dotfiles_dir] 
    }

    #Some ugly shit for getting the configs in the right place
#    file { "${home}/Library/Application Support/KeyRemap4Macbook/":
#      ensure => "directory",
#    }
#    file { "${home}/Library/Application Support/KeyRemap4Macbook/private.xml":
#      ensure => link,
#      target => "${dotfiles_dir}/configs/private.xml",
#      require => Repository[$dotfiles_dir],
#    }
}
