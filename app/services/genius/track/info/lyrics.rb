module Genius
  module Track
    class Info
      class Lyrics < Genius::Track::Info
        private

        def primary_args
          [@args.track_slug]
        end

        def no_data?
          lyrics.blank?
        end

        def lyrics
          @lyrics ||= lyrics_original || lyrics_alternative
        end

        def lyrics_original
          response_data.css('.lyrics p').text.presence
        end

        def response_data
          @response_data ||= Nokogiri::HTML.parse(response)
        end

        def response
          RestClient.get(link)
        end

        def link
          "https://genius.com#{@args.track_slug}"
        end

        def lyrics_alternative
          nodes = xpath_data('Lyrics__Container')

          nodes.css('br').each { |br| br.replace("\n") }

          nodes.text
        end

        def xpath_data(class_name)
          response_data.xpath(
            "//*[contains(@class, '#{class_name}')]"
          )
        end

        def data
          { lyrics: lyrics }
        end
      end
    end
  end
end
