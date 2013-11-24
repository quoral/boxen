class people::kallekrantz::windowmanager{
  include keyremap4macbook
  include pckeyboardhack
  package { 'slate': 
    provider => 'brewcask',
    require => Class['brewcask']
  }
}
