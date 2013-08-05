class people::schwomp::windowmanager{
    include keyremap4macbook
    include pckeyboardhack
    #Remember to set pckeyboardhack and keyremap4macbook stuff later on. This doesn't set anything.
    #package{ 'tranquil':
    #	source		=> 	'http://cl.ly/OCGB/download/tranquil.pkg',
    #	provider	=>	pkgdmg,
    #	ensure 		=>	present
    #}
    #$xnomad_dir = "${boxen::config::srcdir}/xnomad"
    #repository { $xnomad_dir:
    #	source	=>	"${::github_login}/xnomad"
    #}
}
