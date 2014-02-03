class people::kallekrantz::login_items{
    osx_login_item{ 'Alfred 2':
        name => "Alfred 2",
        path => "/Applications/Alfred 2.app",
        hidden => true,
        require => Class['alfred']
    }
    osx_login_item{ 'Slate':
        name    =>  "Slate",
        path    =>  "/Users/${boxen_user}/Applications/Slate.app",
        hidden  =>  true,
        require =>  Class[people::kallekrantz::windowmanager]
    }
    osx_login_item{ 'ShadowKiller':
        name    =>  "ShadowKiller",
        path    =>  "/Applications/ShadowKiller.app",
        hidden  =>  true,
        require =>  Class[people::kallekrantz::windowmanager]
    }
}
