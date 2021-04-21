module Genius
  module Track
    class Base < Genius::Base
      private

      def primary_args
        [@args.path]
      end

      def response_data
        @response_data ||= Nokogiri::HTML.parse(response)
      end

      def response
        RestClient.get(link)
      end

      def link
        "https://genius.com/#{@args.path}"
      end

      def data
        { track: track_data }
      end

      def title
        track_info('title') || title_alternative
      end

      def track_info(class_name)
        response_data.css(
          ".header_with_cover_art-primary_info-#{class_name}"
        ).text.presence
      end

      def title_alternative
        response_data.css('.jQiTNQ').text
      end

      def artist_data
        { name: artist_name }
      end

      def artist_name
        track_info('primary_artist') ||
          artist_name_alternative
      end

      def artist_name_alternative
        response_data.css('.eTAmkN').text
      end

      def lyrics
        lyrics_original || lyrics_alternative
      end

      def lyrics_original
        response_data.css('.lyrics p').text.presence
      end

      def lyrics_alternative
        response_data.css('.jgQsqn br').each do |br|
          br.replace("\n")
        end

        response_data.css('.jgQsqn').text
      end
    end
  end
end
