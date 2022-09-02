module API
  module Muffon
    module Profiles
      class PostsController < API::Muffon::ProfilesController
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
              *%i[profile_id token page limit]
            )
          )
        end

        def create_data
          ::Muffon::Processor::Profile::Post::Creator.call(
            params.slice(
              *%i[profile_id token other_profile_id text],
              *sendable_attachment_types
            )
          )
        end

        def update_data
          ::Muffon::Processor::Profile::Post::Updater.call(
            params.slice(
              *%i[profile_id token post_id text],
              *sendable_attachment_types
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
