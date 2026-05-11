module Muffon
  module Formatter
    module Library
      module Album
        class Base < Muffon::Formatter::Album::Base
          private

          def album_record
            @album_record ||= library_album_record.album
          end

          def library_album_record
            @args[:library_album_record]
          end

          def source_data
            library_album_record.source_data
          end

          def library_album_data
            {
              id: library_album_record.id,
              artist: library_artist_data
            }
          end

          def library_artist_data
            { id: library_artist_record.id }
          end

          def library_artist_record
            @library_artist_record ||=
              library_album_record.library_artist
          end

          def image_data
            library_album_record.image_data
          end

          def tracks_count
            library_album_record.library_tracks_count
          end

          def playlists_count
            library_album_record.playlists_count
          end

          def creation_date
            datetime_formatted(
              raw_creation_date
            )
          end

          def raw_creation_date
            library_album_record.created_at
          end
        end
      end
    end
  end
end
