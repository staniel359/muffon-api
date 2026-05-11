module Muffon
  module Formatter
    module Album
      class Base < Muffon::Formatter::Base
        include Muffon::Mixins::Album

        private

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
          @artist_record ||= album_record.artist
        end

        def listeners_count
          album_record.listeners_count
        end
      end
    end
  end
end
