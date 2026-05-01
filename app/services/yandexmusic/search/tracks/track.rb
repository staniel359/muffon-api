module YandexMusic
  module Search
    class Tracks
      class Track < YandexMusic::Base
        include YandexMusic::Mixins::Track

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_track_data
          ]
        end

        def data
          Muffon::Formatter::Source::Search::Tracks::Track.call(
            source_original_link:,
            source_name:,
            source_track_id: yandexmusic_id,
            title:,
            artists:,
            album_title:,
            source_album_id: album_yandexmusic_id,
            image_data:,
            duration:,
            is_audio_present: audio_present?,
            **query_match_args,
            **self_args
          )
        end

        def raw_track_data
          @args[:raw_track_data]
        end
      end
    end
  end
end
