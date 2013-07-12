class people::schwomp::applications{
	include zsh
	include python
	include chrome::canary
	include chrome
	include alfred
	include shortcat
    include java
    include android::sdk
    include android::platform_tools
    include android::studio
    include sublime_text_2
    include iterm2::dev
    
    class { 'intellij':
        edition => 'community'
    }
}