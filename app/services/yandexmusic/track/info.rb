module YandexMusic
  module Track
    class Info < YandexMusic::Track::Base
      include YandexMusic::Mixins::Track

      private

      def track_data
        Muffon::Formatter::Source::Track::Info.call(
          source_original_link:,
          source_name:,
          source_track_id: yandexmusic_id,
          title:,
          artists:,
          album_title:,
          source_album_id: album_yandexmusic_id,
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
