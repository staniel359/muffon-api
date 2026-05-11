module Muffon
  module Formatter
    module Favorites
      module Album
        class Base < Muffon::Formatter::Album::Base
          private

          def album_record
            @album_record ||= favorite_album_record.album
          end

          def favorite_album_record
            @args[:favorite_album_record]
          end

          def source_data
            favorite_album_record.source_data
          end

          def id
            favorite_album_record.id
          end

          def image_data
            favorite_album_record.image_data
          end

          def creation_date
            datetime_formatted(
              raw_creation_date
            )
          end

          def raw_creation_date
            favorite_album_record.created_at
          end
        end
      end
    end
  end
end
