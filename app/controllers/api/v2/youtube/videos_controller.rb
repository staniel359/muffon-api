module API
  module V2
    module YouTube
      class VideosController < API::V2::BaseController
        def info
          render_data_with_status
        end

        def description
          render_data_with_status
        end

        def tags
          render_data_with_status
        end

        def related
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

        def related_data
          ::YouTube::Video::Related.call(
            params.slice(
              *%i[video_id page limit]
            )
          )
        end
      end
    end
  end
end
