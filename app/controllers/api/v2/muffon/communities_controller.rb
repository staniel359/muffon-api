module API
  module V2
    module Muffon
      class CommunitiesController < API::V2::BaseController
        def index
          render_data_with_status
        end

        def create
          render_data_with_status
        end

        def info
          render_data_with_status
        end

        def posts
          render_data_with_status
        end

        def update
          render_data_with_status
        end

        def destroy
          render_data_with_status
        end

        private

        def index_data
          ::Muffon::Communities.call(
            params.slice(
              *%i[page limit]
            )
          )
        end

        def create_data
          ::Muffon::Processor::Community::Creator.call(
            params.slice(
              *%i[profile_id token title description image]
            )
          )
        end

        def info_data
          ::Muffon::Community::Info.call(
            params.slice(
              *%i[community_id]
            )
          )
        end

        def posts_data
          ::Muffon::Community::Posts.call(
            params.slice(
              *%i[community_id page limit]
            )
          )
        end

        def update_data
          ::Muffon::Processor::Community::Updater.call(
            params.slice(
              *%i[community_id profile_id token title description image]
            )
          )
        end

        def destroy_data
          ::Muffon::Processor::Community::Destroyer.call(
            params.slice(
              *%i[community_id profile_id token]
            )
          )
        end
      end
    end
  end
end
