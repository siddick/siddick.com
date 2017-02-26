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
    list = paginate(items, options)
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

  def article_data(date)
      date = Time.parse(date)
      Time.now.year == date.year ? date.strftime("%d %b") : date.strftime("%d %b %Y")
  end

  def page_identifier(identifier, page)
    if page == 1
      identifier
    else
      identifier.sub(/\/?$/, "/#{PageName}#{page}/")
    end
  end

  def paginate(items, options)
    items = items.select{|item| item[:created_at] }.
      sort{|a, b| Time.parse(b[:created_at]) <=> Time.parse(a[:created_at]) }
    items.reverse! if (options[:tag])
    list  = []
    until items.empty?
      list << items.slice!(0..(PageLimit - 1))
    end
    list
  end
end
include ItemHelper
