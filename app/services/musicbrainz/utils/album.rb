module MusicBrainz
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        album['title']
      end

      def artists_list
        album['artist-credit']
      end

      def source_data
        {
          name: source_name,
          id: album['id']
        }
      end

      def image_data
        image_data_formatted(
          album['id'],
          model_name
        )
      end

      def release_date
        date_formatted(
          raw_release_date
        )
      end

      def raw_release_date
        album['date'] ||
          album['first-release-date']
      end
    end
  end
end
