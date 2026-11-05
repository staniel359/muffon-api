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
                'aacfac2667c05ef896415c2380cb2e73' \
                '7b4c5e81e62887228263c1b9b077405f'
            }
          }
        }.to_json
      end
    end
  end
end
