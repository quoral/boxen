class people::kallekrantz::osx{

    include dockutil

    dockutil::item{ 'Add Chrome':
        item    => "/Applications/Google Chrome Canary.app",
        label   => "Google Chrome",
        position => 1,
        action  => "add",
        require => Class['chrome::canary']
    }

    dockutil::item { 'Add iTerm':
        item     => "/Applications/iTerm.app",
        label    => "iTerm",
        action   => "add",
        position => 3,
        require  => Class['iterm2::dev'],
    }

    dockutil::item { 'Add Spotify':
        item    => "/Applications/Spotify.app",
        label   => "Spotify",
        position => 5,
        action  => "add",
        require => Class['spotify']
    }

    ## Remove the default applications in the dock

    dockutil::item { 'Remove Launchpad':
        item    => "/Applications/Launchpad.app",
        label   => "Launchpad",
        action  => "remove",
    }


    dockutil::item { 'Remove Mission Control':
        item => "/Applications/Mission Control.app",
        label   => "Mission Control",
        action => "remove",
    }

    dockutil::item { 'Remove Mail':
        item => "/Applications/Mail.app",
        label   => "Mail",
        action => "remove",
    }

    dockutil::item { 'Remove Contacts':
        item => "/Applications/Contacts.app",
        label   => "Contacts",
        action => "remove",
    }

    dockutil::item { 'Remove Calendar':
        item => "/Applications/Calendar.app",
        label   => "Calendar",
        action => "remove",
    }

    dockutil::item { 'Remove Reminders':
        item => "/Applications/Reminders.app",
        label   => "Reminders",
        action => "remove",
    }

    dockutil::item { 'Remove Notes':
        item => "/Applications/Notes.app",
        label   => "Notes",
        action => "remove",
    }

    dockutil::item { 'Remove Messages':
        item => "/Applications/Messages.app",
        label   => "Messages",
        action => "remove",
    }

    dockutil::item { 'Remove FaceTime':
        item => "/Applications/FaceTime.app",
        label   => "FaceTime",
        action => "remove",
    }

    dockutil::item { 'Remove Photo Booth':
        item => "/Applications/Photo Booth.app",
        label   => "Photo Booth",
        action => "remove",
    }

    dockutil::item { 'Remove iTunes':
        item => "/Applications/iTunes.app",
        label   => "iTunes",
        action => "remove",
    }

    dockutil::item { 'Remove App Store':
        item => "/Applications/App Store.app",
        label   => "App Store",
        action => "remove",
    }

    dockutil::item { 'Remove System Preferences':
        item => "/Applications/System Preferences.app",
        label   => "System Preferences",
        action => "remove",
    }
    dockutil::item { 'Remove iPhoto':
      item => "/Applications/iPhoto.app",
      label => "iPhoto",
      action => "remove"
    }
    dockutil::item { 'Remove iBooks':
      item => "/Applications/iBooks.app",
      label => "iBooks",
      action => "remove"
    }
    dockutil::item { 'Remove Maps':
      item => "/Applications/Maps.app",
      label => "Maps",
      action => "remove"
    }

}
