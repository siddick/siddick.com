module ItemHelper

  PageLayout = "article_list"
  PageName   = "page-"
  PageLimit  = 7

  def create_asset_item(file)
    extension = File.extname(file)
    basename  = "/assets/#{File.basename(file, extension)}/"
    options   = { :filename => file, :extension => extension.sub(/^\./, ""), :is_hidden => true }
    self.items << Nanoc::Item.new(file, options, basename, :binary => true)
  end

  def create_article_items(items, identifier, options = {})
    list = paginate(items)
    path = identifier
    list.each_with_index do |items, page|
      page += 1
      prev_page = page != 1 ? page_identifier(identifier, page - 1) : nil
      next_page = page != list.size ? page_identifier(identifier, page + 1) : nil
      self.items << Nanoc::Item.new("", options.merge(
        :items => items, :page => page, :prev_page => prev_page, :next_page => next_page,
        :layout => PageLayout), page_identifier(identifier, page))
    end
  end

  def page_identifier(identifier, page)
    if page == 1
      identifier
    else
      identifier.sub(/\/?$/, "/#{PageName}#{page}/")
    end
  end

  def paginate(items)
    items = items.select{|item| item[:created_at] }.
      sort_by{|item| Time.parse(item[:created_at]) }
    list  = []
    until items.empty?
      list << items.slice!(0..(PageLimit - 1))
    end
    list
  end
end
include ItemHelper
