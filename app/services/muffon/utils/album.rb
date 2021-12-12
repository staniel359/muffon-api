module Muffon
  module Utils
    module Album
      private

      def find_album
        @find_album ||= ::Album.with_artist_title(
          find_artist.id, title
        )
      end

      def find_artist
        @find_artist ||= ::Artist.with_name(
          artist_name
        )
      end

      def artist_name
        artist_names
      end

      def library_id
        return if @args[:profile_id].blank?

        find_profile_album&.id
      end

      def find_profile_album
        profile.profile_albums.find_by(
          album_id: find_album.id
        )
      end

      def listened_id
        return if @args[:profile_id].blank?

        find_listened_album&.id
      end

      def find_listened_album
        profile.listened_albums.find_by(
          album_id: find_album.id
        )
      end

      def bookmark_id
        return if @args[:profile_id].blank?

        find_bookmark_album&.id
      end

      def find_bookmark_album
        profile.bookmark_albums.find_by(
          album_id: find_album.id
        )
      end

      def favorite_id
        return if @args[:profile_id].blank?

        find_favorite_album&.id
      end

      def find_favorite_album
        profile.favorite_albums.find_by(
          album_id: find_album.id
        )
      end

      def listeners_count
        find_album.listeners_count
      end
    end
  end
end
