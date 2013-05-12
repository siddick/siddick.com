require "bundler/setup"
Bundler.require :default

Compass.configuration do |compass|
  compass.http_path     = "/"
  compass.project_path  = "."
  compass.sass_dir      = "content/assets/stylesheets"
  compass.images_dir    = "vendor/assets/images"
  compass.fonts_dir     = "vendor/assets/font"

  compass.generated_images_dir  = "output/assets"
  compass.css_dir               = "output/assets"
  compass.sass_options          = { :syntax => :scss }
  compass.relative_assets       = true
end

Nanoc::Helpers::Sprockets.configure do |config|
  config.environment = Nanoc::Filters::Sprockets.environment
  config.prefix = '/assets'
  config.digest = true
end

include Nanoc::Helpers::Rendering
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Sprockets
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::XMLSitemap

include Nanoc::Toolbox::Helpers::HtmlTag
include Nanoc::Toolbox::Helpers::Gravatar
