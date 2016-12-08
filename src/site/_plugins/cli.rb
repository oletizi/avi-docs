require 'json'

module Jekyll
  class CLI < Liquid::Block
    include Liquid::StandardFilters

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      text = super.to_s
      lines_by_prompt = Hash.new { |h, k| h[k]=[] }
      data_output_lines = []
      out = ''
      i = 1
      pattern = '\s*(:.*>\s*)(.*)'

      text.each_line do |line|
        if (match = line.match(/#{pattern}/))
          prompt, cmd = match.captures
          lines_by_prompt[prompt] << i
          out += cmd + "\n"
        else
          out += line
          data_output_lines << i
        end
        i+=1
      end

      prompt_params = []
      lines_by_prompt.each do |prompt, lines|
        param = lines.join(',') + '|' + prompt
        prompt_params << param
      end
      prompt_param = prompt_params.join(';')
      data_param = ' data-output="' + data_output_lines.join(',') +'" '
      user_param = ' data-user=""'
      out = '<pre class="command-line language-bash" data-prompt="' + prompt_param + '" ' + data_param + ' ' + user_param + '><code>' + out + '</code></pre>'
    end
  end
end

Liquid::Template.register_tag('cli', Jekyll::CLI)