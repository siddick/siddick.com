# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

require "bundler/setup"
Bundler.require :default

Nanoc::Helpers::Sprockets.configure do |config|
  config.environment = Nanoc::Filters::Sprockets.environment
  config.prefix = '/assets'
  config.digest = true
end

include Nanoc::Helpers::Rendering
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Sprockets
