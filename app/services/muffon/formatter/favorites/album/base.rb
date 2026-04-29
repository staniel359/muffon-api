module Muffon
  module Formatter
    module Favorites
      module Album
        class Base < Muffon::Formatter::Base
          include Muffon::Mixins::Album

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

          def title
            album_record.title
          end

          def artists
            [artist_data]
          end

          def artist_data
            { name: artist_record.name }
          end

          def artist_record
            album_record.artist
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
