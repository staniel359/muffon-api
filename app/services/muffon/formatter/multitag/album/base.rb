module Muffon
  module Formatter
    module Multitag
      module Album
        class Base < Muffon::Formatter::Base
          include Muffon::Mixins::Album

          private

          def album_record
            @args[:album_record]
          end

          def source_data
            album_record.source_data
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
            album_record.image_data
          end

          def listeners_count
            album_record.listeners_count
          end
        end
      end
    end
  end
end
