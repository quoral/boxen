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
    osx_login_item{ 'Slate':
        name => "Slate",
        path => "/Applications/Slate.app",
        hidden => true,
        require => Class['slate']
    }
    osx_login_item{ 'Shortcat':
        name => "Shortcat",
        path => "/Applications/Shortcat.app",
        hidden => true,
        require => Class['shortcat']
    }
}