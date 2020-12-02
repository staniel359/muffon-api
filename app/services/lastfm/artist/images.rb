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
          total_pages: total_pages,
          images: images
        }
      end

      def name
        response_data.css('.header-new-title').text
      end

      def images
        return [] if page > total_pages

        images_list.map { |i| image_data(i) }
      end

      def images_list
        response_data.css('.image-list-item img')
      end

      def image_data(image)
        {
          original: crop(image, ''),
          large: crop(image, '/600x600'),
          medium: crop(image, '/300x300'),
          small: crop(image, '/174s'),
          extrasmall: crop(image, '/64s')
        }
      end

      def crop(image, size)
        image['src'].sub('/avatar170s', size)
      end
    end
  end
end
