module ItemHelper
  def create_asset_item(file)
    extension = File.extname(file)
    basename  = "/assets/#{File.basename(file, extension)}/"
    options   = { :filename => file, :extension => extension.sub(/^\./, ""), :is_hidden => true }
    Nanoc::Item.new(file, options, basename, :binary => true)
  end
end
include ItemHelper
