module Muffon
  module Profile
    module Library
      module Track
        class Base < Muffon::Profile::Library::Base
          private

          def required_args
            [
              *super,
              :library_id
            ]
          end

          def not_found?
            super || library_track_record.blank?
          end

          def library_track_record
            if defined?(@library_track_record)
              @library_track_record
            else
              @library_track_record =
                library_tracks.find_by(
                  id: @args[:library_id]
                )
            end
          end

          def library_data
            { track: track_data }
          end
        end
      end
    end
  end
end
