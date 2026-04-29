module Muffon
  module Formatter
    module Library
      module Artist
        class Base < Muffon::Formatter::Base
          include Muffon::Mixins::Artist

          private

          def source_data
            artist_record.source_data
          end

          def artist_record
            @artist_record ||= library_artist_record.artist
          end

          def library_artist_record
            @args[:library_artist_record]
          end

          def library_artist_data
            { id: library_artist_record.id }
          end

          def name
            artist_record.name
          end

          def image_data
            artist_record.image_data
          end

          def tracks_count
            library_artist_record.library_tracks_count
          end

          def albums_count
            library_artist_record.library_albums_count
          end

          def playlists_count
            library_artist_record.playlists_count
          end

          def creation_date
            datetime_formatted(
              raw_creation_date
            )
          end

          def raw_creation_date
            library_artist_record.created_at
          end
        end
      end
    end
  end
end
