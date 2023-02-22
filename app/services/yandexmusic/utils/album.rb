module YandexMusic
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        title_formatted(
          raw_title,
          extra_title
        )
      end

      def raw_title
        album['title']
      end

      def extra_title
        album['version']
      end

      def artists_list
        album['artists'].presence ||
          [artist]
      end

      def artist
        {
          'id' => 171,
          'name' => 'Various artists'
        }
      end

      def source_data
        {
          name: source_name,
          id: album['id']
        }
      end

      def image_data
        image_data_formatted(
          album
        )
      end

      def release_date
        date_formatted(
          album['year'].to_s
        )
      end
    end
  end
end
