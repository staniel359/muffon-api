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
        self_data[:library_artist_id]
      end

      def self_data
        @self_data ||=
          Muffon::Self.call(
            profile_id: @args[:profile_id],
            model: 'artist',
            model_id: artist_id
          )
      end

      def artist_id
        find_artist.id
      end

      def favorite_id
        self_data[:favorite_artist_id]
      end

      def bookmark_id
        self_data[:bookmark_artist_id]
      end

      def listened_id
        self_data[:listened_artist_id]
      end

      def image_data
        find_artist.image_data
      end

      def listeners_count
        find_artist.listeners_count
      end
    end
  end
end
