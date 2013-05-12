module LinkHelper
  def relative_asset_path(path)
    relative_path_to(asset_path(path))
  end

  def li_link_to(name, path, options = {})
    path = path.sub(/\/?$/,"/")
    class_name = path == @item.identifier ? :active : nil
    if options[:icon]
      name = tag(:span, :class => "icon-#{options.delete(:icon)}") + " " + name
    end
    content_tag(:li,
      link_to(name, relative_path_to(path)),
      { :class => class_name }.merge(options))
  end

  def image_tag(path, options = {})
    tag(:img, options.merge(:src => asset_path(path)))
  end
end

include LinkHelper
