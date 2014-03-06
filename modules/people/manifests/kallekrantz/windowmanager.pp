class people::kallekrantz::windowmanager{
  package { 'amethyst':
    provider => 'brewcask',
    require => Class['brewcask']
  }
}
