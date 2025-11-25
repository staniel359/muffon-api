module Muffon
  module Profile
    module Library
      module Track
        class Base < Muffon::Profile::Library::Base
          include Muffon::Utils::Library::Track

          private

          def required_args
            super + %i[
              library_id
            ]
          end

          def not_found?
            super ||
              library_track.blank?
          end

          def library_track
            if instance_variable_defined?(
              :@library_track
            )
              @library_track
            else
              @library_track =
                library_tracks.find_by(
                  id: @args[:library_id]
                )
            end
          end

          def library_data
            { track: track_data }
          end

          def track_data
            {
              source: source_data,
              library: library_track_data,
              player_id: player_source_id,
              title:,
              artist: artists_minimal_data,
              artists:
            }
          end
        end
      end
    end
  end
end
