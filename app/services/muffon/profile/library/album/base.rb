module Muffon
  module Profile
    module Library
      module Album
        class Base < Muffon::Profile::Library::Base
          include Muffon::Utils::Library::Album

          private

          def required_args
            super + %i[
              library_id
            ]
          end

          def not_found?
            super ||
              library_album.blank?
          end

          def library_album
            if instance_variable_defined?(
              :@library_album
            )
              @library_album
            else
              @library_album =
                library_albums.find_by(
                  id: @args[:library_id]
                )
            end
          end

          def library_data
            { album: album_data }
          end

          def album_base_data
            {
              source: source_data,
              library: library_album_data,
              title:,
              artist: artists_minimal_data,
              artists:
            }.compact
          end
        end
      end
    end
  end
end
