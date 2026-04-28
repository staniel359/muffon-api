module Genius
  module Search
    class Tracks
      class Track < Genius::Search::Tracks
        include Genius::Mixins::Track

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
            source_track_id: genius_id,
            title:,
            artists:,
            album_title:,
            source_album_id: album_genius_id,
            image_data:,
            duration: nil,
            is_audio_present: audio_present?,
            **self_args
          )
        end

        def raw_track_data
          @args[:raw_track_data]['result']
        end
      end
    end
  end
end
