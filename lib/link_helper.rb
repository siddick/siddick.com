module LinkHelper
  include Nanoc::Helpers::LinkTo
  include Nanoc::Toolbox::Helpers::HtmlTag

  def article?
    @item[:kind] == "article"
  end

  def fb_comments
    url = "#{@site.config[:base_url]}#{@item.path}"
    content_tag(:div, "", :class => "fb-comments", :"data-width" => 700, :"data-href" => url )
  end

  def url_for(item)
    "#{@site.config[:base_url]}#{item.path}"
  end

  def li_link_to(name, path, options = {})
    path = path.sub(/\/?$/,"/")
    class_name = path == @item.identifier ? :active : nil
    if options[:icon]
      name = content_tag(:span, "", :class => "fa fa-#{options.delete(:icon)}") + " " + name
    end
    content_tag(:li,
      link_to(name, path),
      { :class => class_name }.merge(options))
  end

  def tag_links(tags)
    if tags
      content_tag(:span, "", :class => "fa fa-tag") + " " +
        tags.split(Seperator).map do |tag|
          link_to(tag, "/tags/#{tag}/")
        end.join(", ")
    end
  end

end

include LinkHelper
