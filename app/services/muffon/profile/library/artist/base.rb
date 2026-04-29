module Muffon
  module Profile
    module Library
      module Artist
        class Base < Muffon::Profile::Library::Base
          private

          def required_args
            [
              *super,
              :library_id
            ]
          end

          def not_found?
            super || library_artist_record.blank?
          end

          def library_artist_record
            if defined?(@library_artist_record)
              @library_artist_record
            else
              @library_artist_record =
                library_artists.find_by(
                  id: @args[:library_id]
                )
            end
          end

          def library_data
            { artist: artist_data }
          end
        end
      end
    end
  end
end
