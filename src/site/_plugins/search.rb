require 'json'
require 'jekyll'
class AlgoliaSearchRecordExtractor
  # Hook to modify a record after extracting
  def custom_hook_each(item, node)
    # 'item' is a hash
    # `node` is a Nokogiri HTML node, so you can access its type through `node.name`
    # or its classname through `node.attr('class')` for example

    # Just return `nil` instead of `item` if you want to discard this record
    # puts "==============================================="
    # puts "ENV:"
    # p ENV
    # puts "/ENV"
    # puts "I'M IN CUSTOM_HOOK_EACH! Item: " + item.to_json
    # puts "Node: " + node.to_json
    item
  end

  # Hook to modify all records after extracting
  def custom_hook_all(items)
    items
  end
end

class AlgoliaSearchJekyllPush < Jekyll::Command
  class << self
    # Hook to exclude some files from indexing
    def custom_hook_excluded_file?(file)
      # return true if filepath =~ %r{^/excluded_dir/}
      pattern = 'docs/' + ENV['DOCS_VERSION'] + '/'
      if file.path =~ %r{^#{pattern}}
        puts 'file path: ' + file.path + ', pattern: ' + pattern + ', MATCHES'
        false
      else
        puts 'file path: ' + file.path + ', patther: ' + pattern + ', NOT MATCH'
        true
      end
    end
  end
end