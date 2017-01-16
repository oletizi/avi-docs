module Jekyll
  class Card < Liquid::Block
    def initialize(tag_name, text, tokens)
      super
      @text = text
      if text.start_with?('href=')
        @href = text.split('=')[1]
      end
    end

    def render(context)
      site = context.registers[:site]
      converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
      lines = super.split("\n")
      while lines[0].eql? ""
        lines.shift
      end
      header = converter.convert(lines.shift)
      rendered = converter.convert(lines.join("\n"))
      out = '<div class="card">'
      if defined? @href
        out += '<a href="' + @href + '">'
      end

      out += '<div class="card-header">' + header + '</div>'

      out += '<div class="card-block">'
      out += rendered
      out += '</div>'

      if defined? @href
        out += '</a>'
      end
      out += '</div>'
    end
  end
end

Liquid::Template.register_tag('card', Jekyll::Card)