module Spotify
  module Mixins
    module Track
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        raw_track_data['name'].presence || 'Untitled'
      end

      def raw_artists
        raw_raw_artists.map do |raw_artist_data|
          name =
            raw_artist_data.dig(
              'profile',
              'name'
            )

          spotify_uri = raw_artist_data['uri']

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

      def raw_raw_artists
        raw_track_data.dig(
          'artists',
          'items'
        )
      end

      def local_track?
        raw_track_data['__typename'] == 'LocalTrack'
      end

      def spotify_id
        raw_track_data['uri'].sub(
          'spotify:track:',
          ''
        )
      end

      def source_original_link
        "https://open.spotify.com/track/#{spotify_id}"
      end

      def album_title
        raw_album_data.try(:[], 'name')
      end

      def raw_album_data
        raw_track_data['albumOfTrack']
      end

      def album_spotify_id
        return if raw_album_data.blank?

        raw_album_data['uri'].sub(
          'spotify:album:',
          ''
        )
      end

      def image_data
        Spotify::Formatter::Image.call(
          images:
        )
      end

      def images
        raw_album_data&.dig(
          'coverArt',
          'sources'
        )
      end

      def duration
        raw_duration
          .fdiv(1_000)
          .round
      end

      def raw_duration
        raw_track_data.dig(
          'duration',
          'totalMilliseconds'
        )
      end

      def audio_present?
        return false if local_track?

        raw_track_data.dig(
          'playability',
          'playable'
        )
      end

      def audio_link
        return if @args[:with_audio].blank?

        Spotify::Utils::Track::Audio::Link.call(
          track_id: @args[:track_id]
        )
      end

      def creation_date
        datetime_formatted(
          raw_creation_date
        )
      end
    end
  end
end
