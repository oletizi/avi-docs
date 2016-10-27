$LOAD_PATH.unshift File.expand_path('../../../site/_plugins', __FILE__)
p $LOAD_PATH
require 'test/unit'
require 'search'
require 'json'
require 'nokogiri'

class TestAlgolia < Test::Unit::TestCase
  def setup()
    @hook = AlgoliaSearchRecordExtractor.new
    @item_json = '{"title":"Network Reachability","layout":"default","type":"page","url":"/docs/latest/network-reachability/","slug":"index","tags":null,"tag_name":"p","raw_html":"<p>In the example above, a Service Engine is required to have access to the following networks:</p>","text":"In the example above, a Service Engine is required to have access to the following networks:","unique_hierarchy":"Network Reachability","css_selector":"p:nth-of-type(3)","css_selector_parent":null,"weight":{"tag_name":0,"heading_relevance":0,"position":2}}'
    @item = JSON.load(@item_json)
    @doc = Nokogiri::HTML('<html><body><p>In the example above, a Service Engine is required to have access to the following networks:</p></body></html>')
    @node = @doc.css('html body p')
  end

  def test_custom_hook_each()
    @hook.custom_hook_each(@item, @node)
  end
end
