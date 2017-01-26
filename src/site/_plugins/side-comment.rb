require 'nokogiri'

module Jekyll
  class SideCommentConverter < Converter
    safe true

    priority :low

    def matches(ext)
      ext =~ /^.md$/
    end

    def output_ext(ext)
      '.html'
    end

    def convert(content)
      doc = Nokogiri::HTML::DocumentFragment.parse(content)

      add_attributes(doc.css('h1'))
      add_attributes(doc.css('h2'))
      add_attributes(doc.css('h3'))
      add_attributes(doc.css('h4'))
      add_attributes(doc.css('img'))
      add_attributes(doc.css('p'))
      add_attributes(doc.css('li'))
      # puts("START: ==================================================")
      # puts(doc.to_html)
      # puts("END:   ==================================================")
      '<div id="commentable-area">' + doc.to_html + '</div>'
    end

    def add_attributes(nodes)
      if nodes
        id = 0
        nodes.each { |node|
          id = id + 1
        node['data-section-id'] = id
          if node['class']
            node['class'] += ' commentable-section'
          else
            node['class'] = 'commentable-section'
          end
        }
      end
    end
  end
end