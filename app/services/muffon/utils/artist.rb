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

      def self_data
        Muffon::Self.call(
          profile_id:,
          token: @args[:token],
          model: 'artist',
          model_id: artist_id
        )
      end

      def profile_id
        @args[:profile_id]
      end

      def artist_id
        find_artist.id
      end

      def image_data
        find_artist.image_data
      end

      def listeners_count
        find_artist.listeners_count
      end

      def profiles_count
        return if test?

        find_artist
          .profiles
          .count
      end
    end
  end
end
