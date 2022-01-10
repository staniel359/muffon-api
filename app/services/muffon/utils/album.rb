module Muffon
  module Utils
    module Album
      include Muffon::Utils::Base

      private

      def find_album
        @find_album ||=
          ::Album.with_artist_title(
            find_artist.id, title
          )
      end

      def find_artist
        @find_artist ||=
          ::Artist.with_name(
            artist_name
          )
      end

      def library_id
        self_data('album')[
          :profile_album_id
        ]
      end

      def album_id
        find_album.id
      end

      def favorite_id
        self_data('album')[
          :favorite_album_id
        ]
      end

      def bookmark_id
        self_data('album')[
          :bookmark_album_id
        ]
      end

      def listened_id
        self_data('album')[
          :listened_album_id
        ]
      end

      def listeners_count
        find_album.listeners_count
      end
    end
  end
end
