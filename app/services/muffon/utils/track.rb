module Muffon
  module Utils
    module Track
      private

      def player_id
        find_track.player_id
      end

      def find_track
        @find_track ||= ::Track.with_artist_title(
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

        find_profile_track&.id
      end

      def find_profile_track
        profile.profile_tracks.find_by(
          track_id: find_track.id
        )
      end

      def find_album
        return if album_title.blank?

        @find_album ||= ::Album.with_artist_title(
          find_artist.id, album_title
        )
      end

      def listened_id
        return if @args[:profile_id].blank?

        find_listened_track&.id
      end

      def find_listened_track
        profile.listened_tracks.find_by(
          track_id: find_track.id
        )
      end

      def bookmark_id
        return if @args[:profile_id].blank?

        find_bookmark_track&.id
      end

      def find_bookmark_track
        profile.bookmark_tracks.find_by(
          track_id: find_track.id
        )
      end

      def favorite_id
        return if @args[:profile_id].blank?

        find_favorite_track&.id
      end

      def find_favorite_track
        profile.favorite_tracks.find_by(
          track_id: find_track.id
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
