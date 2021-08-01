module Muffon
  module Utils
    module Track
      private

      def library_id
        return if @args.profile_id.blank?

        profile_track&.id
      end

      def profile_track
        ProfileTrack.find_by(
          profile_id: @args.profile_id,
          track_id: find_track.id
        )
      end

      def find_track
        ::Track.with_artist_title(
          find_artist.id, title
        )
      end

      def find_artist
        ::Artist.with_name(
          artist_name
        )
      end

      def artist_name
        artist_names
      end
    end
  end
end
