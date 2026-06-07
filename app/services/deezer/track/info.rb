module Deezer
  module Track
    class Info < Deezer::Track::Base
      include Deezer::Mixins::Track

      private

      def track_data
        Muffon::Formatter::Source::Track::Info.call(
          source_original_link:,
          source_name:,
          source_track_id: deezer_id,
          title:,
          artists:,
          album_title:,
          source_album_id: album_deezer_id,
          image_data:,
          release_date:,
          plays_count: nil,
          duration:,
          description: nil,
          tags: nil,
          tags_size: nil,
          is_audio_present: audio_present?,
          audio_link:,
          **self_args
        )
      end
    end
  end
end
