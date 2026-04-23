module LastFM
  module Multitag
    class Tracks
      class Track < LastFM::Multitag::Tracks
        include LastFM::Mixins::Track

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
          Muffon::Formatter::Multitag::Tracks::Track.call(
            track_record:,
            source_original_link:,
            source_name:,
            source_track_id: nil,
            title:,
            artists:,
            **self_args
          )
        end

        def track_record
          @args[:raw_track_data]
        end

        def title
          track_record.title
        end

        def artist_name
          artist_record.name
        end

        def artist_record
          @artist_record ||= track_record.artist
        end
      end
    end
  end
end
