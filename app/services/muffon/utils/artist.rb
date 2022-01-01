module Muffon
  module Utils
    module Artist
      private

      def find_artist
        @find_artist ||=
          ::Artist.with_name(
            name
          )
      end

      def library_id
        find_profile_artist&.id
      end

      def find_profile_artist
        return if @args[:profile_id].blank?

        ProfileArtist.find_by(
          profile_id: @args[:profile_id],
          artist_id:
        )
      end

      def artist_id
        find_artist.id
      end

      def favorite_id
        find_favorite_artist&.id
      end

      def find_favorite_artist
        return if @args[:profile_id].blank?

        FavoriteArtist.find_by(
          profile_id: @args[:profile_id],
          artist_id:
        )
      end

      def bookmark_id
        find_bookmark_artist&.id
      end

      def find_bookmark_artist
        return if @args[:profile_id].blank?

        BookmarkArtist.find_by(
          profile_id: @args[:profile_id],
          artist_id:
        )
      end

      def listened_id
        find_listened_artist&.id
      end

      def find_listened_artist
        return if @args[:profile_id].blank?

        ListenedArtist.find_by(
          profile_id: @args[:profile_id],
          artist_id:
        )
      end
    end
  end
end
