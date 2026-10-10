module AmazonMusic
  module Mixins
    module Album
      include Muffon::Mixins::Formatting::Collection
      include AmazonMusic::Mixins::Base

      private

      def title
        raw_album_data['shortTitle']
      end

      def raw_artists
        raw_raw_artists.map do |raw_artist_data|
          {
            name: raw_artist_data.dig('node', 'name'),
            source_id: raw_artist_data.dig('node', 'id')
          }
        end
      end

      def raw_raw_artists
        raw_album_data.dig(
          'contributingArtists',
          'edges'
        )
      end

      def amazonmusic_id
        raw_album_data['id']
      end

      def source_original_link
        "#{WEB_BASE_URL}/albums/#{amazonmusic_id}"
      end

      def image_data
        AmazonMusic::Formatter::Image.call(
          image_id:
        )
      end

      def image_id
        raw_album_data.dig(
          'images',
          0,
          'id'
        )
      end

      def release_date
        Muffon::Formatter::Date.call(
          date: raw_release_date
        )
      end

      def raw_release_date
        raw_album_data['releaseDate']
      end

      def raw_tracks
        raw_album_data.dig(
          'tracksConnection',
          'edges'
        )
      end
    end
  end
end
