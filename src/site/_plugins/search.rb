require 'json'
class AlgoliaSearchRecordExtractor
  # Hook to modify a record after extracting
  def custom_hook_each(item, node)
    # 'item' is a hash
    # `node` is a Nokogiri HTML node, so you can access its type through `node.name`
    # or its classname through `node.attr('class')` for example

    # Just return `nil` instead of `item` if you want to discard this record
    puts "I'M IN CUSTOM_HOOK_EACH! Item: " + item.to_json
    puts "Node: " + node.to_json
    item
  end

  # Hook to modify all records after extracting
  def custom_hook_all(items)
    items
  end

end