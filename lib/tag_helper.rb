
module TagHelper

  Seperator = /\s*[ ,]\s*/

  def tag_items
    @@tag_items ||=
      begin
        list = {}
        @items.map do |item|
          item[:tags].split(Seperator).each do |tag|
            list[tag] ||= []
            list[tag].push(item)
          end if item[:tags]
        end
        list
      end
  end

end

include TagHelper
