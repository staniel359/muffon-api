module YouTubeMusic
  module Track
    class Info < YouTubeMusic::Track::Base
      include YouTubeMusic::Mixins::Track

      private

      def track_data
        Muffon::Formatter::Source::Track::Info.call(
          source_original_link:,
          source_name:,
          source_track_id: youtube_id,
          title:,
          artists:,
          album_title:,
          source_album_id: album_youtube_id,
          image_data:,
          release_date: nil,
          duration:,
          description: nil,
          description_size: nil,
          tags: nil,
          tags_size: nil,
          plays_count: nil,
          is_audio_present: audio_present?,
          audio_link:,
          **self_args
        )
      end
    end
  end
end
