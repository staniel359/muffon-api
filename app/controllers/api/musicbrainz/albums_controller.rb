module API
  module MusicBrainz
    class AlbumsController < API::BaseController
      def info; end

      def tags; end

      private

      def info_data
        ::MusicBrainz::Album::Info.call(
          params.slice(
            *%i[album_id profile_id token]
          )
        )
      end

      def tags_data
        ::MusicBrainz::Album::Tags.call(
          params.slice(
            *%i[album_id]
          )
        )
      end
    end
  end
end
