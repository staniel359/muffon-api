module Muffon
  module Profile
    module Library
      module Album
        class Base < Muffon::Profile::Library::Base
          include Muffon::Utils::Library::Album

          private

          def primary_args
            [
              @args[:profile_id],
              @args[:library_id]
            ]
          end

          def no_data?
            super || library_album.blank?
          end

          def library_album
            @library_album ||=
              library_albums.find_by(
                id: @args[:library_id]
              )
          end

          def library_data
            { album: album_data }
          end
        end
      end
    end
  end
end
