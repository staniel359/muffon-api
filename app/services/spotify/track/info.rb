module Spotify
  module Track
    class Info < Spotify::Track::Base
      include Spotify::Mixins::Track

      private

      def track_data
        Muffon::Formatter::Track::Info.call(
          source_original_link:,
          source_name:,
          source_track_id: spotify_id,
          title:,
          artists:,
          album_title:,
          source_album_id: album_spotify_id,
          image_data:,
          release_date: nil,
          plays_count: nil,
          duration:,
          description: nil,
          description_size: nil,
          tags: nil,
          tags_size: nil,
          is_audio_present: audio_present?,
          audio_link:,
          **self_args
        )
      end

      def raw_raw_artists
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
    end
  end
end
