module Audius
  module Mixins
    module Album
      include Muffon::Mixins::Formatting::Collection

      def title
        raw_album_data['playlist_name']
      end

      def raw_artists
        [raw_artist_data]
      end

      def raw_artist_data
        {
          name: raw_album_data.dig(
            'user',
            'name'
          ),
          source_id: raw_album_data.dig(
            'user',
            'id'
          )
        }
      end

      def audius_id
        raw_album_data['playlist_id']
      end

      def source_original_link
        "https://audius.co#{audius_slug}"
      end

      def audius_slug
        raw_album_data['permalink']
      end

      def image_data
        Audius::Formatter::Image.call(
          images_data:
        )
      end

      def images_data
        raw_album_data['artwork']
      end

      def release_date
        Muffon::Formatter::Date.call(
          date: raw_release_date
        )
      end

      def raw_release_date
        raw_album_data['release_date']
      end

      def description
        raw_album_data['description']
      end

      def raw_tracks
        raw_album_data['tracks']
      end
    end
  end
end
