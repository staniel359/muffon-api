module API
  module Bandcamp
    class IdController < API::BaseController
      def artist; end

      def album; end

      def track; end

      private

      def artist_data
        ::Bandcamp::Id::Artist.call(
          params.slice(
            *%i[artist]
          )
        )
      end

      def album_data
        ::Bandcamp::Id::Album.call(
          params.slice(
            *%i[artist album]
          )
        )
      end

      def track_data
        ::Bandcamp::Id::Track.call(
          params.slice(
            *%i[artist track]
          )
        )
      end
    end
  end
end
