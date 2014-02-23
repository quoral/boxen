class people::kallekrantz::configs{
  include git
  git::config::global{ 'color.ui':
    value => 'auto',
  }
  git::config::global{ 'status.short':
    value => 'true',
  }
}
