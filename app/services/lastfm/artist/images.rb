module LastFM
  module Artist
    class Images < LastFM::Base
      def call
        return not_found_data if parsed_response.text.blank?

        { artist: images_data }
      end

      private

      def parsed_response
        @parsed_response ||= Nokogiri::HTML.parse(response)
      end

      def response
        RestClient.get(images_link, params: { page: @args.page })
      rescue RestClient::NotFound
        nil
      end

      def images_link
        "https://www.last.fm/music/#{artist_name}/+images"
      end

      def artist_name
        CGI.escape(@args.artist.to_s)
      end

      def images_data
        {
          name: name,
          images: images,
          page: page
        }
      end

      def name
        parsed_response.css('.header-new-title').text
      end

      def images
        parsed_response.css('.image-list-item img').map do |i|
          i['src'].sub('/avatar170s', '')
        end
      end

      def page
        (current_page.presence || 1).to_i
      end

      def current_page
        parsed_response.css('.pagination-page span').text
      end
    end
  end
end
