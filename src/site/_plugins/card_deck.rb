module Jekyll
  class CardDeck < Liquid::Block
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      '<div class="card-deck">' + super + '</div>'
    end
  end
end

Liquid::Template.register_tag('carddeck', Jekyll::CardDeck)
