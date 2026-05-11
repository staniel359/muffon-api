module Muffon
  module Formatter
    module Bookmarks
      module Artist
        class Base < Muffon::Formatter::Artist::Base
          private

          def artist_record
            @artist_record ||= bookmark_artist_record.artist
          end

          def bookmark_artist_record
            @args[:bookmark_artist_record]
          end

          def source_data
            artist_record.source_data
          end

          def id
            bookmark_artist_record.id
          end

          def creation_date
            datetime_formatted(
              raw_creation_date
            )
          end

          def raw_creation_date
            bookmark_artist_record.created_at
          end
        end
      end
    end
  end
end
