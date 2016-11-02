$LOAD_PATH << File.expand_path('../../../site/_plugins', __FILE__)
require 'jekyll'
require 'algoliasearch'
require 'algoliasearch-jekyll'
require 'test/unit'
require 'rspec/mocks/standalone'
require 'search'
require 'json'
require 'nokogiri'

class TestAlgolia < Test::Unit::TestCase

  def setup()
    @file_mock = MockFile.new
    @file_mock.set_path("/foo/bar/baz")
    @filter = AlgoliaSearchJekyllPush.new
    @hook = AlgoliaSearchRecordExtractor.new
    @item_json = '{"title":"Network Reachability","layout":"default","type":"page","url":"/docs/latest/network-reachability/","slug":"index","tags":null,"tag_name":"p","raw_html":"<p>In the example above, a Service Engine is required to have access to the following networks:</p>","text":"In the example above, a Service Engine is required to have access to the following networks:","unique_hierarchy":"Network Reachability","css_selector":"p:nth-of-type(3)","css_selector_parent":null,"weight":{"tag_name":0,"heading_relevance":0,"position":2}}'
    @item = JSON.load(@item_json)
    @doc = Nokogiri::HTML('<html><body><p>In the example above, a Service Engine is required to have access to the following networks:</p></body></html>')
    @node = @doc.css('html body p')
  end

  def test_custom_hook_each()
    processed = @hook.custom_hook_each(@item, @node)
  end

  def test_custom_hook_excluded_file()
    mock = MockFile.new
    mock.set_path("/foo/bar/baz")
    puts mock.class.instance_methods(false)
    puts 'Filter: '
    puts 'Instance variables: '
    puts @filter.pretty_print_instance_variables
    puts 'Methods: '
    puts @filter.methods.sort

  end
end

class MockFile
  def path()
    @path
  end
  def set_path(path)
    @path = path
  end
end
