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
        format_param(@args.artist)
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        {
          name: name,
          page: page,
          total_pages: total_pages,
          images: images_data
        }
      end

      def name
        response_data.css('.header-new-title').text
      end

      def images_data
        return [] if page > total_pages

        images_list_data.presence || [images(nil)]
      end

      def images_list_data
        images_list.map { |i| images(i['src']) }
      end

      def images_list
        response_data.css('.image-list-item img')
      end

      def images(image)
        LastFM::Utils::ImagesData.call(
          image: image, model: 'artist'
        )
      end
    end
  end
end
