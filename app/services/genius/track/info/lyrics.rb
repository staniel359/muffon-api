module Genius
  module Track
    class Info
      class Lyrics < Genius::Track::Info
        def call
          data
        end

        private

        def data
          { lyrics: }
        end

        def lyrics
          return '' if @args[:track_slug].blank?

          format_children(
            lyrics_nodes
          ).compact.flatten
        end

        def lyrics_nodes
          response_data.xpath(
            "//*[contains(@class, 'Lyrics__Container')]"
          )
        end

        def response_data
          Nokogiri::HTML.parse(
            response
          )
        end

        def link
          "https://genius.com#{@args[:track_slug]}"
        end

        def format_children(node)
          node.children.map do |n|
            format_node(n)
          end
        end

        def format_node(node)
          if text?(node)
            node.text
          elsif new_line?(node)
            "\n"
          elsif italic?(node)
            format_children(node)
          elsif with_annotation?(node)
            annotation_data(node)
          end
        end

        def text?(node)
          node.instance_of?(
            Nokogiri::XML::Text
          )
        end

        def new_line?(node)
          node.name == 'br'
        end

        def italic?(node)
          node.name == 'i'
        end

        def with_annotation?(node)
          node
            .attributes['class']
            &.value
            &.include?(
              'ReferentFragmentdesktop__ClickTarget'
            )
        end

        def annotation_data(node)
          {
            annotation_id:
              annotation_id(node),
            text: format_children(
              node.children[0]
            )
          }
        end

        def annotation_id(node)
          node
            .attributes['href']
            .value
            .split('/')[1]
            .to_i
        end
      end
    end
  end
end
