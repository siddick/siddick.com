require "bundler/setup"
Bundler.require :default

Haml::Filters::CodeRay.encoder         = :div
Haml::Filters::CodeRay.encoder_options = { :css => :class }

include Nanoc::Helpers::Rendering
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::XMLSitemap
include Nanoc::Helpers::Filtering

include Nanoc::Toolbox::Helpers::HtmlTag
include Nanoc::Toolbox::Helpers::Gravatar
