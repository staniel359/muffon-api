module YandexMusic
  module Album
    module Tracks
      class Track < YandexMusic::Album::Base
        include YandexMusic::Mixins::Track

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_track_data
            album_data
          ]
        end

        def data
          Muffon::Formatter::Source::Album::Tracks::Track.call(
            source_original_link:,
            source_name:,
            source_track_id: yandexmusic_id,
            title:,
            artists:,
            album_data:,
            image_data:,
            duration:,
            is_audio_present: audio_present?,
            **self_args
          )
        end

        def raw_track_data
          @args[:raw_track_data]
        end

        def album_data
          @args[:album_data]
        end

        def image_data
          album_data[:image]
        end
      end
    end
  end
end
