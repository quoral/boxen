class people::kallekrantz::my_modern_space_cadet{
  require dotfiles

  include seil
  include karabiner

  include seil::login_item
  include karabiner::login_item

  seil::map{ 'capslock': value => 80 }
  karabiner::private_xml{ 'private.xml': source => "$people::kallekrantz::dotfiles::dotfiles_dir/configs/private.xml" }
}
