module LastFM
  module Artist
    class Images < LastFM::Web
      private

      def link
        "https://www.last.fm/music/#{artist_name}/+images"
      end

      def artist_name
        CGI.escape(@args.artist.to_s)
      end

      def data
        { artist: images_data }
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
    end
  end
end
