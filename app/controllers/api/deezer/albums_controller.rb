module API
  module Deezer
    class AlbumsController < API::BaseController
      def info; end

      def links; end

      private

      def info_data
        ::Deezer::Album::Info.call(
          params.slice(
            *%i[album_id profile_id token language]
          )
        )
      end

      def links_data
        ::Deezer::Album::Links.call(
          params.slice(
            *%i[album_id]
          )
        )
      end
    end
  end
end
