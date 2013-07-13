class people::schwomp::dotfiles{
    repository{ "${my_sorucedir}/dotfiles":
        source => 'schwomp/dotfiles',
}

file { "${my_homedir}/.vim:
        ensure => link,
        mode => '0644',
        target => "${my_sourcedir}/dotfiles/vim",
        require => Repository[${my_sourcedir}/dotfiles"],
}
