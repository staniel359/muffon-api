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

      def self_data
        Muffon::Self.call(
          profile_id:,
          token: @args[:token],
          model: 'album',
          model_id: album_id
        )
      end

      def profile_id
        @args[:profile_id]
      end

      def album_id
        find_album.id
      end

      def listeners_count
        find_album.listeners_count
      end

      def profiles_count
        return if test?

        find_album
          .profiles
          .not_deleted
          .count
      end
    end
  end
end
