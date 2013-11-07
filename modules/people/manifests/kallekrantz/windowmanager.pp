class people::kallekrantz::windowmanager{
  include keyremap4macbook
  include pckeyboardhack
  package { 'amethyst': 
    provider => 'brewcask',
    require => Class['brewcask']
  }
}
