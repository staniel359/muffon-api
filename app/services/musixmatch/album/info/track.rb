module MusixMatch
  module Album
    class Info
      class Track < MusixMatch::Album::Info
        include MusixMatch::Utils::Track

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
          {
            **self_data,
            source: source_data,
            player_id: player_source_id,
            title:,
            artist: artists_minimal_data,
            artists:,
            image: image_data
          }.compact
        end

        def raw_track_data
          @args[:raw_track_data]
        end
      end
    end
  end
end
