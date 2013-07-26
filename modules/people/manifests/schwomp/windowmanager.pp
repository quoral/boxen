class people::schwomp::windowmanager{
    
    
    include slate
    include keyremap4macbook
    keyremap4macbook::remap{ 'F19_Hyper': }
    keyremap4macbook::set{ 'parameter.keyoverlaidmodifier_timeout':
        value => '200'
    }
    include pckeyboardhack

    pckeyboardhack::bind { 'keyboard bindings':
        mappings => { 'CapsLock' => 80 }
    }
}
