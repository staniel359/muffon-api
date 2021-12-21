module Muffon
  module Utils
    module Track
      private

      def player_id
        find_track.player_id
      end

      def find_track
        @find_track ||=
          ::Track.with_artist_title(
            find_artist.id, title
          )
      end

      def find_artist
        @find_artist ||=
          ::Artist.with_name(
            artist_name
          )
      end

      def find_album
        return if album_title.blank?

        @find_album ||=
          ::Album.with_artist_title(
            find_artist.id, album_title
          )
      end

      def library_id
        find_profile_track&.id
      end

      def find_profile_track
        return if @args[:profile_id].blank?

        ProfileTrack.find_by(
          profile_id: @args[:profile_id],
          track_id: track_id
        )
      end

      def track_id
        find_track.id
      end

      def favorite_id
        find_favorite_track&.id
      end

      def find_favorite_track
        return if @args[:profile_id].blank?

        FavoriteTrack.find_by(
          profile_id: @args[:profile_id],
          track_id: track_id
        )
      end

      def bookmark_id
        find_bookmark_track&.id
      end

      def find_bookmark_track
        return if @args[:profile_id].blank?

        BookmarkTrack.find_by(
          profile_id: @args[:profile_id],
          track_id: track_id
        )
      end

      def listened_id
        find_listened_track&.id
      end

      def find_listened_track
        return if @args[:profile_id].blank?

        ListenedTrack.find_by(
          profile_id: @args[:profile_id],
          track_id: track_id
        )
      end

      def playlist_track_id
        find_playlist_track&.id
      end

      def find_playlist_track
        return if @args[:playlist_id].blank?

        PlaylistTrack.find_by(
          playlist_id: @args[:playlist_id],
          track_id: track_id
        )
      end

      def duration
        duration_formatted(
          duration_seconds
        )
      end
    end
  end
end
