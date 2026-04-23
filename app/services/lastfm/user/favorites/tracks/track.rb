module LastFM
  module User
    module Favorites
      class Tracks
        class Track < LastFM::User::Favorites::Tracks
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
            Muffon::Formatter::User::Favorites::Tracks::Track.call(
              source_original_link:,
              source_name:,
              source_track_id: nil,
              title:,
              artists:,
              creation_date:
            )
          end

          def raw_track_data
            @args[:raw_track_data]
          end
        end
      end
    end
  end
end
