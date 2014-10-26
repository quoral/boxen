class people::kallekrantz::osx_defaults {

  include osx::dock
  include osx::dock::autohide
  include osx::global::expand_save_dialog
  include osx::finder::unhide_library
  include osx::finder::show_hidden_files
  include osx::disable_app_quarantine
  include osx::software_update
  include osx::global::enable_keyboard_control_access
  class { 'osx::sound::interface_sound_effects':
    enable => false
  }
}
