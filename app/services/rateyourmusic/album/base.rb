module RateYourMusic
  module Album
    class Base < RateYourMusic::Base
      private

      def primary_args
        [@args.album]
      end

      def no_data?
        album.blank?
      end

      def album
        @album ||= response_data.css(
          '.release_page'
        )
      end

      def response_data
        Nokogiri::HTML.parse(response)
      end

      def response
        RestClient.get(link, headers)
      end

      def link
        "https://rateyourmusic.com/#{@args.album}"
      end

      def data
        { album: album_data }
      end

      def tags_list
        album
          .css('.release_genres .genre')
          .map(&:text)
          .reject(&:blank?)
      end
    end
  end
end
