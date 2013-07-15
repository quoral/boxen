class people::schwomp::windowmanager{
    
    
    include slate
    include keyremap4macbook
    include keyremap4macbook::login_item
    
    keyremap4macbook::set{ 'parameter.keyoverlaidmodifier_timeout':
        value => '200'
    }
    include pckeyboardhack

    include pckeyboardhack::login_item
    pckeyboardhack::bind { 'keyboard bindings':
        mappings => { 'CapsLock' => 80 }
    }
}
