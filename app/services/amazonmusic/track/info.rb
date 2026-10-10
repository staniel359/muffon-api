module AmazonMusic
  module Track
    class Info < AmazonMusic::Track::Base
      include AmazonMusic::Mixins::Track

      private

      def track_data
        Muffon::Formatter::Source::Track::Info.call(
          source_original_link:,
          source_name:,
          source_track_id: amazonmusic_id,
          title:,
          artists:,
          image_data:,
          album_title:,
          source_album_id: album_amazonmusic_id,
          plays_count: nil,
          duration:,
          release_date: nil,
          description: nil,
          tags: nil,
          tags_size: nil,
          is_audio_present: audio_present?,
          audio_link:,
          **self_args
        )
      end

      def request_payload
        {
          'operationName' => 'TrackDetailPage',
          'variables' => {
            'id' => @args[:track_id],
            'isAuthenticated' => true
          },
          'extensions' => {
            'clientLibrary' => {
              'name' => '@apollo/client',
              'version' => '4.1.6'
            },
            'persistedQuery' => {
              'version' => 1,
              'sha256Hash' =>
                '8472e4564effd84e1d4558b7ade98ff6' \
                '612e1ea3ba5c2b6f18c1848f8cff9c28'
            }
          }
        }.to_json
      end
    end
  end
end
