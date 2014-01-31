class people::kallekrantz::windowmanager{
  package { 'slate': 
    provider => 'brewcask',
    require => Class['brewcask']
  }
}
