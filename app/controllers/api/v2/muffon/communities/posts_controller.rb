module API
  module V2
    module Muffon
      module Communities
        class PostsController < API::V2::Muffon::CommunitiesController
          def index
            render_data_with_status
          end

          def create
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
            ::Muffon::Community::Posts.call(
              params.slice(
                *%i[community_id page limit]
              )
            )
          end

          def create_data
            ::Muffon::Processor::Community::Post::Creator.call(
              params.slice(
                *%i[
                  community_id profile_id token
                  by_community content tracks images
                ]
              )
            )
          end

          def update_data
            ::Muffon::Processor::Community::Post::Updater.call(
              params.slice(
                *%i[
                  community_id post_id profile_id token
                  by_community content tracks images
                ]
              )
            )
          end

          def destroy_data
            ::Muffon::Processor::Community::Post::Destroyer.call(
              params.slice(
                *%i[community_id post_id profile_id token]
              )
            )
          end
        end
      end
    end
  end
end
