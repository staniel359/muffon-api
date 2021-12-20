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
        find_profile_album&.id
      end

      def find_profile_album
        return if @args[:profile_id].blank?

        ProfileAlbum.find_by(
          profile_id: @args[:profile_id],
          album_id: album_id
        )
      end

      def album_id
        find_album.id
      end

      def favorite_id
        find_favorite_album&.id
      end

      def find_favorite_album
        return if @args[:profile_id].blank?

        FavoriteAlbum.find_by(
          profile_id: @args[:profile_id],
          album_id: album_id
        )
      end

      def bookmark_id
        find_bookmark_album&.id
      end

      def find_bookmark_album
        return if @args[:profile_id].blank?

        BookmarkAlbum.find_by(
          profile_id: @args[:profile_id],
          album_id: album_id
        )
      end

      def listened_id
        find_listened_album&.id
      end

      def find_listened_album
        return if @args[:profile_id].blank?

        ListenedAlbum.find_by(
          profile_id: @args[:profile_id],
          album_id: album_id
        )
      end

      def listeners_count
        find_album.listeners_count
      end
    end
  end
end
