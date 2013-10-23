require "slim"
require 'rapricot'
require 'dotenv'
Dotenv.load

# Helpers
 #helpers do
   #def some_helper
     #'helping'
   #end
 #end



# Blog configurations
activate :blog do |blog|
  blog.sources               = "articles/:year-:month-:day-:title.html"
  blog.permalink             = ":title.html"
  # blog.prefix              = "blog"
  # blog.taglink             = "tags/:tag.html"
  # blog.layout              = "layout"
  # blog.summary_separator   = /(READMORE)/
  # blog.summary_length      = 250
  # blog.year_link           = ":year.html"
  # blog.month_link          = ":year/:month.html"
  # blog.day_link            = ":year/:month/:day.html"
  # blog.default_extension   = ".markdown"

  blog.tag_template          = "tag.html"
  blog.calendar_template     = "calendar.html"

  # blog.paginate            = true
  # blog.per_page            = 10
  # blog.page_link           = "page/:num"
end

page "/feed.xml", :layout => false



# General configurations
# Time.zone = "UTC"
activate :autoprefixer
activate :automatic_image_sizes

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'



# Build-specific configuration
configure :build do
  activate :gzip
  activate :minify_css
  activate :minify_javascript
  activate :cache_buster

  if ENV.include?('DEPLOY_STAGING')
    activate :s3_sync do |s3_sync|
      s3_sync.bucket                = ENV['AWS_S3_BUCKET']
      s3_sync.region                = ENV['AWS_S3_REGION']
      s3_sync.aws_access_key_id     = ENV['AWS_ACCESS_KEY_ID']
      s3_sync.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
      s3_sync.prefer_gzip           = true
      s3_sync.delete                = true
      s3_sync.after_build           = true
    end
  end
end

