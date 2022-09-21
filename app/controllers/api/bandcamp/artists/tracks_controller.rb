module API
  module Bandcamp
    module Artists
      class TracksController < API::BaseController
        def info; end

        def description; end

        def tags; end

        private

        def info_data
          ::Bandcamp::Track::Info.call(
            params.slice(
              *%i[artist_id track_id profile_id]
            )
          )
        end

        def description_data
          ::Bandcamp::Track::Description.call(
            params.slice(
              *%i[artist_id track_id]
            )
          )
        end

        def tags_data
          ::Bandcamp::Track::Tags.call(
            params.slice(
              *%i[artist_id track_id]
            )
          )
        end
      end
    end
  end
end
