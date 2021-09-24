module Muffon
  module Utils
    module Artist
      private

      def library_id
        return if @args.profile_id.blank?

        find_profile_artist&.id
      end

      def find_profile_artist
        ProfileArtist.find_by(
          profile_id: @args.profile_id,
          artist_id: find_artist.id
        )
      end

      def find_artist
        @find_artist ||= ::Artist.with_name(
          name
        )
      end

      def listened_id
        return if @args.profile_id.blank?

        find_listened_artist&.id
      end

      def find_listened_artist
        ListenedArtist.find_by(
          profile_id: @args.profile_id,
          artist_id: find_artist.id
        )
      end

      def bookmark_id
        return if @args.profile_id.blank?

        find_bookmark_artist&.id
      end

      def find_bookmark_artist
        BookmarkArtist.find_by(
          profile_id: @args.profile_id,
          artist_id: find_artist.id
        )
      end

      def favorite_id
        return if @args.profile_id.blank?

        find_favorite_artist&.id
      end

      def find_favorite_artist
        FavoriteArtist.find_by(
          profile_id: @args.profile_id,
          artist_id: find_artist.id
        )
      end
    end
  end
end
