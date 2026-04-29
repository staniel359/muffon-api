module Muffon
  module Formatter
    module Favorites
      module Artist
        class Base < Muffon::Formatter::Base
          include Muffon::Mixins::Artist

          private

          def artist_record
            @artist_record ||= favorite_artist_record.artist
          end

          def favorite_artist_record
            @args[:favorite_artist_record]
          end

          def source_data
            artist_record.source_data
          end

          def id
            favorite_artist_record.id
          end

          def name
            artist_record.name
          end

          def image_data
            artist_record.image_data
          end

          def creation_date
            datetime_formatted(
              raw_creation_date
            )
          end

          def raw_creation_date
            favorite_artist_record.created_at
          end
        end
      end
    end
  end
end
