module Spotify
  module Track
    class Info < Spotify::Track::Base
      private

      def track_data
        {
          **self_data,
          **track_base_data,
          album: album_data,
          image: image_data,
          profiles_count:,
          duration:,
          audio: audio_base_data,
          **with_more_data
        }.compact
      end

      def track_base_data
        {
          source: source_data,
          player_id: player_source_id,
          title:,
          artist: artists_base_data,
          artists:
        }
      end

      def raw_artists
        [
          *raw_primary_artists,
          *raw_other_artists
        ]
      end

      def raw_primary_artists
        raw_track_data.dig(
          'firstArtist',
          'items'
        )
      end

      def raw_other_artists
        raw_track_data.dig(
          'otherArtists',
          'items'
        )
      end

      def payload
        {
          'variables' => {
            'uri' => spotify_uri
          },
          'operationName' => 'getTrack',
          'extensions' => {
            'persistedQuery' => {
              'version' => 1,
              'sha256Hash' => '612585ae06ba435ad26369870deaae23b5c8800a256cd8a57e08eddc25a37294' # rubocop:disable Layout/LineLength
            }
          }
        }.to_json
      end

      def audio_link
        Spotify::Utils::Audio::Link.call(
          track_id: @args[:track_id]
        )
      end
    end
  end
end
