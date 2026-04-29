module Muffon
  module Profile
    module Library
      module Album
        class Base < Muffon::Profile::Library::Base
          private

          def required_args
            [
              *super,
              :library_id
            ]
          end

          def not_found?
            super || library_album_record.blank?
          end

          def library_album_record
            if defined?(@library_album_record)
              @library_album_record
            else
              @library_album_record =
                library_albums.find_by(
                  id: @args[:library_id]
                )
            end
          end

          def library_data
            { album: album_data }
          end
        end
      end
    end
  end
end
