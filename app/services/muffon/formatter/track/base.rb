module Muffon
  module Formatter
    module Track
      class Base < Muffon::Formatter::Base
        include Muffon::Mixins::Track

        private

        def title
          track_record.title
        end

        def artists
          [artist_data]
        end

        def artist_data
          { name: artist_record.name }
        end

        def artist_record
          @artist_record ||= track_record.artist
        end

        def album_data
          return if album_record.blank?

          {
            source: album_source_data,
            title: album_record.title
          }
        end
      end
    end
  end
end
