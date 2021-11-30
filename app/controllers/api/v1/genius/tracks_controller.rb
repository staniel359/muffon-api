module API
  module V1
    module Genius
      class TracksController < API::V1::BaseController
        def info
          render_data_with_status
        end

        def description
          render_data_with_status
        end

        def tags
          render_data_with_status
        end

        def lyrics
          render_data_with_status
        end

        private

        def info_data
          ::Genius::Track::Info.call(
            params.slice(
              *%i[track_id profile_id]
            )
          )
        end

        def description_data
          ::Genius::Track::Description.call(
            params.slice(:track_id)
          )
        end

        def tags_data
          ::Genius::Track::Tags.call(
            params.slice(:track_id)
          )
        end

        def lyrics_data
          ::Genius::Track::Lyrics.call(
            params.slice(:track_id)
          )
        end
      end
    end
  end
end
