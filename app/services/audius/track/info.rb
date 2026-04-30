module Audius
  module Track
    class Info < Audius::Track::Base
      include Audius::Mixins::Track

      private

      def track_data
        Muffon::Formatter::Source::Track::Info.call(
          source_original_link:,
          source_name:,
          source_track_id: audius_id,
          title:,
          artists:,
          album_title:,
          source_album_id: album_audius_id,
          image_data:,
          release_date: nil,
          duration:,
          description:,
          tags:,
          tags_size: 'extrasmall',
          plays_count: nil,
          is_audio_present: audio_present?,
          audio_link:,
          **self_args
        )
      end
    end
  end
end
