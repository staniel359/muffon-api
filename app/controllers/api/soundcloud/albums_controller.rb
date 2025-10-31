module API
  module SoundCloud
    class AlbumsController < API::BaseController
      def info; end

      def description; end

      def tags; end

      def links; end

      private

      def info_data
        ::SoundCloud::Album::Info.call(
          params.slice(
            *%i[
              album_id
              profile_id
              token
            ]
          )
        )
      end

      def description_data
        ::SoundCloud::Album::Description.call(
          params.slice(
            *%i[
              album_id
            ]
          )
        )
      end

      def tags_data
        ::SoundCloud::Album::Tags.call(
          params.slice(
            *%i[
              album_id
            ]
          )
        )
      end

      def links_data
        ::SoundCloud::Album::Links.call(
          params.slice(
            *%i[
              album_id
            ]
          )
        )
      end
    end
  end
end
