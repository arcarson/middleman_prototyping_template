Deployment requires
  - An .env file with:
      AWS_ACCESS_KEY_ID=
      AWS_SECRET_ACCESS_KEY=
      AWS_S3_BUCKET_STAGING=
      AWS_S3_REGION_STAGING=

  - s3cmd tool
    - To install with homebrew:
      $ brew install s3cmd
    - To configure:
      $ s3cmd --configure
      When prompted paste in access key and secret key - leave the rest blank

  - In Makefile replace "amazon-bucket-name-here" with intended amazon bucket name.

Deploy to s3 staging:
  $ make deploy_staging

Spin up local server:
  $ bundle exec middleman server
or
  $ make server

Build:
  $ bundle exec middleman build

