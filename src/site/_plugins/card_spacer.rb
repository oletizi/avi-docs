module Jekyll
  class CardSpacer < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
    end

    def render(context)
      '<div class="card card-spacer">&nbsp;</div>'
    end
  end
end

Liquid::Template.register_tag('cardspacer', Jekyll::CardSpacer)