module Muffon
  module Formatter
    module Library
      module Tag
        class Base < Muffon::Formatter::Base
          private

          def library_tag_data
            { id: tag_record.id }
          end

          def tag_record
            @args[:tag_record]
          end

          def name
            tag_record.name
          end

          def top_tracks_count
            @args[:top_tracks_count]
          end

          def top_albums_count
            @args[:top_albums_count]
          end

          def artists_count
            @args[:artists_count]
          end

          def library_count
            tag_record.library_count
          end
        end
      end
    end
  end
end
