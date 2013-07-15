class people::schwomp::windowmanager{
    require people::schwomp::dotfiles
    #Windowmanager shit!
    include slate
    include keyremap4macbook
    include keyremap4macbook::login_item
    keyremap4macbook::private_xml{'private.xml':
        source => "${people::schwomp::dotfiles::dotfiles_dir}/configs/private.xml",
    }
    keyremap4macbook::set{ 'parameter.keyoverlaidmodifier_timeout':
        value => '200'
    }
    include pckeyboardhack::login_item
    pckeyboardhack::bind { 'keyboard bindings':
        mappings => { 'capslock' => 80 }
    }
}