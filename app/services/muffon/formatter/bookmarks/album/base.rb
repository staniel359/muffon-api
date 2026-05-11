module Muffon
  module Formatter
    module Bookmarks
      module Album
        class Base < Muffon::Formatter::Album::Base
          private

          def album_record
            @album_record ||= bookmark_album_record.album
          end

          def bookmark_album_record
            @args[:bookmark_album_record]
          end

          def source_data
            bookmark_album_record
              .source_data
              &.deep_symbolize_keys
          end

          def id
            bookmark_album_record.id
          end

          def image_data
            bookmark_album_record.image_data
          end

          def creation_date
            datetime_formatted(
              raw_creation_date
            )
          end

          def raw_creation_date
            bookmark_album_record.created_at
          end
        end
      end
    end
  end
end
