module API
  module Bandcamp
    module Artists
      class AlbumsController < API::BaseController
        def info; end

        def description; end

        def tags; end

        private

        def info_data
          ::Bandcamp::Album::Info.call(
            params.slice(
              *%i[
                artist_id album_id album_type
                profile_id token
              ]
            )
          )
        end

        def description_data
          ::Bandcamp::Album::Description.call(
            params.slice(
              *%i[artist_id album_id album_type]
            )
          )
        end

        def tags_data
          ::Bandcamp::Album::Tags.call(
            params.slice(
              *%i[artist_id album_id album_type]
            )
          )
        end
      end
    end
  end
end
