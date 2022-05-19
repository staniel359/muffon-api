module Muffon
  module Utils
    module Artist
      include Muffon::Utils::Base

      private

      def find_artist
        @find_artist ||=
          ::Artist.with_name(
            name
          )
      end

      def library_id
        self_data('artist')[
          :library_artist_id
        ]
      end

      def artist_id
        find_artist.id
      end

      def favorite_id
        self_data('artist')[
          :favorite_artist_id
        ]
      end

      def bookmark_id
        self_data('artist')[
          :bookmark_artist_id
        ]
      end

      def listened_id
        self_data('artist')[
          :listened_artist_id
        ]
      end

      def image_data
        ::Artist
          .associated
          .with_name(name)
          .image_data
      end

      def listeners_count
        find_artist.listeners_count
      end
    end
  end
end
