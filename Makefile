server:
	bundle exec middleman server
compile_icon_font:
	fontcustom compile icons/
	mv source/font/icon-font/_fontcustom.scss source/stylesheets/scaffolding
deploy_staging:
	DEPLOY_STAGING=true middleman build --clean
