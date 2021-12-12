module Muffon
  module Utils
    module Artist
      private

      def find_artist
        @find_artist ||= ::Artist.with_name(
          name
        )
      end

      def library_id
        return if @args[:profile_id].blank?

        find_profile_artist&.id
      end

      def find_profile_artist
        profile.profile_artists.find_by(
          artist_id: find_artist.id
        )
      end

      def listened_id
        return if @args[:profile_id].blank?

        find_listened_artist&.id
      end

      def find_listened_artist
        profile.listened_artists.find_by(
          artist_id: find_artist.id
        )
      end

      def bookmark_id
        return if @args[:profile_id].blank?

        find_bookmark_artist&.id
      end

      def find_bookmark_artist
        profile.bookmark_artists.find_by(
          artist_id: find_artist.id
        )
      end

      def favorite_id
        return if @args[:profile_id].blank?

        find_favorite_artist&.id
      end

      def find_favorite_artist
        profile.favorite_artists.find_by(
          artist_id: find_artist.id
        )
      end
    end
  end
end
