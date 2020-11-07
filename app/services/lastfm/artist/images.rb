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
          page: page,
          images: images
        }
      end

      def name
        response_data.css('.header-new-title').text
      end

      def images
        images_list.map do |i|
          {
            original: crop_image(i, ''),
            large: crop_image(i, '/600x600'),
            medium: crop_image(i, '/300x300')
          }
        end
      end

      def images_list
        response_data.css('.image-list-item img')
      end

      def crop_image(image, crop)
        image['src'].sub('/avatar170s', crop)
      end
    end
  end
end
