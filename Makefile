server:
	bundle exec middleman server
deploy_staging:
	DEPLOY_STAGING=true middleman build --clean
