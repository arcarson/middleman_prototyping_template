server:
	bundle exec middleman server
deploy_staging:
	s3cmd del --recursive --force s3://amazon-bucket-name-here/
	rm -r build/
	DEPLOY_STAGING=true foreman run middleman build
