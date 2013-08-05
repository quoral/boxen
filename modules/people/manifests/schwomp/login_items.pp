class people::schwomp::login_items{
    osx_login_item{ 'Alfred 2':
        name => "Alfred 2",
        path => "/Applications/Alfred 2.app",
        hidden => true,
        require => Class['alfred']
    }
    osx_login_item{ 'PCRemap4Macbook':
        name => "PCKeyboardHack",
        path => "/Applications/PCKeyboardHack.app",
        hidden => true,
        require => Class['pckeyboardhack']
    }
    osx_login_item{ 'KeyRemap4MacBook':
        name => "KeyRemap4MacBook",
        path => "/Applications/KeyRemap4MacBook.app",
        hidden => true,
        require => Class['keyremap4macbook']
    }
    $xnomad_dir = "${boxen::config::srcdir}/xnomad"
    #osx_login_item{ 'Xnomad':
    #    name    =>  "Xnomad",
    #    path    =>  "${xnomad_dir}/xnomad",
    #    hidden  =>  true,
    #    require =>  Repository[$xnomad_dir]
    #}
    osx_login_item{ 'Shortcat':
        name => "Shortcat",
        path => "/Applications/Shortcat.app",
        hidden => true,
        require => Class['shortcat']
    }
}