module Audius
  module Search
    class Tracks
      class Track < Audius::Search::Base
        include Audius::Mixins::Track

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
            source_track_id: audius_id,
            title:,
            artists:,
            image_data:,
            album_title:,
            source_album_id: album_audius_id,
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
