module Muffon
  module Utils
    module Album
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
        self_data[:library_album_id]
      end

      def self_data
        @self_data ||=
          Muffon::Self.call(
            profile_id: @args[:profile_id],
            model: 'album',
            model_id: album_id
          )
      end

      def album_id
        find_album.id
      end

      def favorite_id
        self_data[:favorite_album_id]
      end

      def bookmark_id
        self_data[:bookmark_album_id]
      end

      def listened_id
        self_data[:listened_album_id]
      end

      def listeners_count
        find_album.listeners_count
      end

      def profiles_count
        return if test?

        find_album
          .profiles
          .count
      end
    end
  end
end
