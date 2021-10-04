module Muffon
  module Utils
    module Track
      private

      def library_id
        return if @args.profile_id.blank?

        find_profile_track&.id
      end

      def find_profile_track
        ProfileTrack.find_by(
          profile_id: @args.profile_id,
          track_id: find_track.id
        )
      end

      def find_track
        @find_track ||= ::Track.with_artist_title(
          find_artist.id, title
        )
      end

      def find_artist
        ::Artist.with_name(
          artist_name
        )
      end

      def find_album
        return if @args.album.blank?

        ::Album.with_artist_title(
          find_artist.id, @args.album
        )
      end

      def listened_id
        return if @args.profile_id.blank?

        find_listened_track&.id
      end

      def find_listened_track
        ListenedTrack.find_by(
          profile_id: @args.profile_id,
          track_id: find_track.id
        )
      end

      def bookmark_id
        return if @args.profile_id.blank?

        find_bookmark_track&.id
      end

      def find_bookmark_track
        BookmarkTrack.find_by(
          profile_id: @args.profile_id,
          track_id: find_track.id
        )
      end

      def favorite_id
        return if @args.profile_id.blank?

        find_favorite_track&.id
      end

      def find_favorite_track
        FavoriteTrack.find_by(
          profile_id: @args.profile_id,
          track_id: find_track.id
        )
      end

      def artist_name
        artist_names
      end
    end
  end
end
