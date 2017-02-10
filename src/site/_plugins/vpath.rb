module Jekyll
  class VPathTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
      @tokens = tokens;
    end

    def render(context)
      # puts context.inspect
      mydir = context.environments.first["page"]["path"]
      dirs = mydir.split(/\//)
      rv = ""
      if dirs.length > 0 && "docs".eql?(dirs[0])
        # puts "Version: " + dirs[1]
        rv = "/docs/" + dirs[1]
      end
      rv
    end
  end
end

Liquid::Template.register_tag('vpath', Jekyll::VPathTag)