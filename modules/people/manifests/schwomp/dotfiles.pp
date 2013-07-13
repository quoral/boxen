class people::schwomp::dotfiles{
    $home = "/Users/${::boxen_user}"
    $dotfiles_dir = "${boxen::config::srcdir}/dotfiles"

    repository { $dotfiles_dir:
      source => "${::github_user}/dotfiles"
    }

    file { "${home}/vim":
      ensure  => link,
      target  => "${dotfiles_dir}/.vim",
      require => Repository[$dotfiles_dir]
    }
}