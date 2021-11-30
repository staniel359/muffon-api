module API
  module V1
    module YouTube
      class VideosController < API::V1::BaseController
        def info
          render_data_with_status
        end

        def description
          render_data_with_status
        end

        def tags
          render_data_with_status
        end

        private

        def info_data
          ::YouTube::Video::Info.call(
            params.slice(:video_id)
          )
        end

        def description_data
          ::YouTube::Video::Description.call(
            params.slice(:video_id)
          )
        end

        def tags_data
          ::YouTube::Video::Tags.call(
            params.slice(:video_id)
          )
        end
      end
    end
  end
end
