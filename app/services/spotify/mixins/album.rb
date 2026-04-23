module Spotify
  module Mixins
    module Album
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        raw_album_data['name']
      end

      def raw_artists
        raw_album_data.dig(
          'artists',
          'items'
        ).map do |raw_artist_data|
          name =
            raw_artist_data.dig(
              'profile',
              'name'
            ) || raw_artist_data.dig(
              'data',
              'profile',
              'name'
            )

          spotify_uri =
            raw_artist_data['uri'] ||
            raw_artist_data.dig('data', 'uri')

          spotify_id =
            spotify_uri&.sub(
              'spotify:artist:',
              ''
            )

          {
            name:,
            source_id: spotify_id
          }
        end
      end

      def spotify_id
        raw_album_data['uri'].sub(
          'spotify:album:',
          ''
        )
      end

      def source_original_link
        "https://open.spotify.com/album/#{spotify_id}"
      end

      def image_data
        Spotify::Formatter::Image.call(
          images:
        )
      end

      def images
        raw_album_data.dig(
          'coverArt',
          'sources'
        )
      end

      def release_date
        return if raw_release_date.blank?

        raw_release_date.to_s
      end

      def raw_release_date
        raw_album_data.dig(
          'date',
          'year'
        )
      end

      def raw_labels
        [raw_album_data['label']]
      end

      def label_name_formatted(
        raw_label_data
      )
        raw_label_data
      end

      def raw_tracks
        raw_album_data.dig(
          'tracksV2',
          'items'
        )
      end
    end
  end
end
