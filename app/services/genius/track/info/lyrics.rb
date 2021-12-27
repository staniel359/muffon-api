module Genius
  module Track
    class Info
      class Lyrics < Genius::Track::Info
        def call
          data
        end

        private

        def data
          { lyrics: lyrics }
        end

        def lyrics
          return '' if @args[:track_slug].blank?

          lyrics_original.presence ||
            lyrics_alternative.presence ||
            ''
        end

        def lyrics_original
          response_data.css(
            '.lyrics p'
          ).text
        end

        def response_data
          @response_data ||=
            Nokogiri::HTML.parse(
              response
            )
        end

        def link
          "https://genius.com#{@args[:track_slug]}"
        end

        def lyrics_alternative
          nodes = xpath_data(
            'Lyrics__Container'
          )

          nodes.css('br').each do |br|
            br.replace("\n")
          end

          nodes.text
        end

        def xpath_data(class_name)
          response_data.xpath(
            "//*[contains(@class, '#{class_name}')]"
          )
        end
      end
    end
  end
end
