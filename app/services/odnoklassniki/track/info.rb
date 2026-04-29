module Odnoklassniki
  module Track
    class Info < Odnoklassniki::Track::Base
      include Odnoklassniki::Mixins::Track

      private

      def track_data
        Muffon::Formatter::Source::Track::Info.call(
          source_original_link:,
          source_name:,
          source_track_id: odnoklassniki_id,
          title:,
          artists:,
          image_data:,
          album_title:,
          source_album_id: album_odnoklassniki_id,
          release_date: nil,
          duration:,
          description: nil,
          tags: nil,
          tags_size: nil,
          plays_count: nil,
          is_audio_present: audio_present?,
          audio_link:,
          **self_args
        )
      end

      def raw_album_data
        response_data.dig(
          'albums',
          0
        )
      end

      def image_url
        response_data['image']
      end
    end
  end
end
