class people::kallekrantz::configs{
  include git
  git::config::global{ 'color.ui':
    value => 'auto',
  }
  git::config::global{ 'status.short':
    value => 'true',
  }
  git::config::global{ 'alias.lg':
    value => "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit",
  }
  
}
