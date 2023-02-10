module Muffon
  module Utils
    module Track
      private

      def player_id
        return '1' if test?

        find_track.player_id
      end

      def find_track
        @find_track ||=
          ::Track.with_artist_title_extra_title(
            find_artist.id, title, extra_title
          )
      end

      def find_artist
        @find_artist ||=
          ::Artist.with_name(
            artist_name
          )
      end

      def extra_title
        nil
      end

      def track_artist_data
        {
          name: artist_names,
          image: artist_image_data
        }.compact
      end

      def artist_image_data
        find_artist.image_data
      end

      def find_album
        return if album_title.blank?

        @find_album ||=
          ::Album.with_artist_title(
            find_artist.id, album_title
          )
      end

      def self_data
        Muffon::Self.call(
          profile_id:,
          token: @args[:token],
          model: 'track',
          model_id: track_id
        )
      end

      def profile_id
        @args[:profile_id]
      end

      def track_id
        find_track.id
      end

      def profiles_count
        return if test?

        find_track
          .profiles
          .count
      end
    end
  end
end
