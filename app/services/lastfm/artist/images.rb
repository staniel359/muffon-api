module LastFM
  module Artist
    class Images < LastFM::Web
      private

      def primary_args
        [@args.artist]
      end

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
        response_data.css('.header-new-title').text
      end

      def images
        response_data.css('.image-list-item img').map do |i|
          i['src'].sub('/avatar170s', '')
        end
      end
    end
  end
end
