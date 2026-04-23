module LastFM
  module Top
    class Tracks
      class Track < LastFM::Top::Tracks
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
          update_record_data!

          Muffon::Formatter::Top::Tracks::Track.call(
            source_original_link:,
            source_name:,
            source_track_id: nil,
            title:,
            artists:,
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
