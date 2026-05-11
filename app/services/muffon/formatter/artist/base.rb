module Muffon
  module Formatter
    module Artist
      class Base < Muffon::Formatter::Base
        include Muffon::Mixins::Artist

        private

        def name
          artist_record.name
        end

        def image_data
          artist_record.image_data
        end

        def listeners_count
          artist_record.listeners_count
        end
      end
    end
  end
end
