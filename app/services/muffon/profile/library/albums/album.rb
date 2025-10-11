module Muffon
  module Profile
    module Library
      class Albums
        class Album < Muffon::Profile::Library::Albums
          include Muffon::Utils::Library::Album

          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              library_album
            ]
          end

          def data
            self_data
              .merge(album_base_data)
              .merge(album_extra_data)
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

          def library_album
            @args[:library_album]
          end

          def album_extra_data
            {
              image: image_data,
              tracks_count:,
              created: created_formatted
            }.compact
          end

          def image_data
            library_album.image_data
          end
        end
      end
    end
  end
end
