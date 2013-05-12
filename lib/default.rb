# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

require "bundler/setup"
Bundler.require :default

Compass.configuration do |compass|
  compass.http_path     = "/"
  compass.project_path  = "."
  compass.sass_dir      = "content/assets/stylesheets"
  compass.images_dir    = "vendor/assets/images"

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
include Nanoc::Toolbox::Helpers::HtmlTag

def relative_asset_path(path)
  relative_path_to(asset_path(path))
end

def li_link_to(name, path)
  path = path.sub(/\/?$/,"/")
  class_name = path == @item.identifier ? "active" : nil
  content_tag("li",
    link_to(name, relative_path_to(path)),
    :class => class_name)
end

def image_tag(path, options = {})
  tag(:img, options.merge(:src => asset_path(path)))
end
