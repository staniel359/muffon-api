module API
  module V2
    module Muffon
      module Profiles
        class PostsController < API::V2::Muffon::ProfilesController
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
            ::Muffon::Profile::Posts.call(
              params.slice(
                *%i[profile_id page limit]
              )
            )
          end

          def create_data
            ::Muffon::Processor::Profile::Post::Creator.call(
              params.slice(
                *%i[
                  profile_id token other_profile_id
                  content tracks images
                ]
              )
            )
          end

          def update_data
            ::Muffon::Processor::Profile::Post::Updater.call(
              params.slice(
                *%i[
                  profile_id token post_id
                  content tracks images
                ]
              )
            )
          end

          def destroy_data
            ::Muffon::Processor::Profile::Post::Destroyer.call(
              params.slice(
                *%i[profile_id token post_id]
              )
            )
          end
        end
      end
    end
  end
end
