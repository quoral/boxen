class people::schwomp::windowmanager{

    include slate
    include keyremap4macbook
    include keyremap4macbook::login_item
    keyremap4macbook::private_xml{'private.xml':
        require => Repository[$dotfiles_dir],
        source => "${dotfiles_dir}/configs/private.xml"
    }
    keyremap4macbook::set{ 'parameter.keyoverlaidmodifier_timeout':
        value => '200'
    }
}