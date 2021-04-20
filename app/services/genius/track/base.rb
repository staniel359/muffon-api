module Genius
  module Track
    class Base < Genius::Base
      private

      def primary_args
        [@args.path]
      end

      def data
        return try_again if lyrics_raw_data.blank?

        { track: track_data }
      end

      def lyrics_raw_data
        response_data.css('.lyrics')[0]
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

      def try_again
        self.class.call(@args)
      end

      def track_data
        {
          title: track_info('title'),
          artist: artist_data,
          lyrics: lyrics
        }
      end

      def lyrics
        lyrics_raw_data.css('p').text
      end

      def track_info(class_name)
        response_data.css(
          ".header_with_cover_art-primary_info-#{class_name}"
        ).text
      end

      def artist_data
        { name: track_info('primary_artist') }
      end
    end
  end
end
