module Redcarpet
  module Render
    class Hiki < Base

      def initialize(render_extensions)
        super()
        @header_offset = 0
        if render_extensions[:header_offset]
          @header_offset = render_extensions[:header_offset]
        end
      end

      def normal_text(text)
        text
      end

      def escape_inline(text)
        ## text.gsub(/&/, "&amp;").gsub(/\"/, "&quot;").gsub(/>/, "&gt;").gsub(/</, "&lt;")
        text
      end

      def block_code(code, language)
        code_text = normal_text(code).chomp
        code_text.gsub!(/^/,'  ')
        "\n#{code_text}\n\n"
      end

      def block_quote(quote)
        quote_text = normal_text(quote).chomp
        quote_text.gsub!(/^/,'""')
        "\n#{quote_text}\n\n"
      end

      def block_html(raw_html)
        html_text = raw_html.chomp
        warning = "XXX: BLOCK_HTML: YOU SHOULD REWRITE IT"
        "\n#{warning}\n#{html_text}\n\n"
      end

      def hrule
        "\n//hr\n"
      end

      def codespan(code)
        "``#{escape_inline(code)}``"
      end

      def header(title, level, anchor="")
        l = level - @header_offset
        case l
        when 1
          "\n! #{title}\n"
        when 2
          "\n!! #{title}\n"
        when 3
          "\n!!!! #{title}\n"
        when 4
          "\n!!!! #{title}\n"
        when 5
          "\n!!!!! #{title}\n"
        end
      end

      def table(header, body)
        header_text = ""
        if header
          header_text = header
        end
        body.chomp!
        "#{header_text}\n\n#{body}\n"
      end

      def table_row(content)
        content+"\n"
      end

      def table_cell(content, alignment)
        "||#{content}"
      end

      def image(link, title, alt_text)
        filename = File.basename(link,".*")
        text = alt_text || title
        "[[#{text}|#{link}]]"
      end

      def autolink(link, link_type)
        "[[#{escape_inline(link)}]]"
      end

      def link(link, title, content)
        "[[#{escape_inline(content)}|#{escape_inline(link)}]]"
      end

      def double_emphasis(text)
        "''#{escape_inline(text)}''"
      end

      def emphasis(text)
        "'#{escape_inline(text)}'"
      end

      def strikethrough(text)
        "==#{escape_inline(text)}=="
      end

      def linebreak
        "\n\n"
      end

      def paragraph(text)
        "\n\n#{text}\n"
      end

      def list(content, list_type)
        case list_type
        when :ordered
          "\n"
        when :unordered
          "\n"
        end
      end

      def list_item(content, list_type)
        case list_type
        when :ordered
          "# #{content.strip}\n"
        when :unordered
          "* #{content.strip}\n"
        end
      end

    end
  end
end
