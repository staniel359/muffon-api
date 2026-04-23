module SoundCloud
  module Track
    class Info < SoundCloud::Track::Base
      include SoundCloud::Mixins::Track

      private

      def track_data
        Muffon::Formatter::Track::Info.call(
          source_original_link:,
          source_name:,
          source_track_id: soundcloud_id,
          title:,
          artists:,
          album_title: nil,
          source_album_id: nil,
          image_data:,
          release_date: nil,
          duration:,
          description:,
          description_size: 'medium',
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
