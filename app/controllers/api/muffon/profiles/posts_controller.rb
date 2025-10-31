module API
  module Muffon
    module Profiles
      class PostsController < API::Muffon::ProfilesController
        def index; end

        def create; end

        def update; end

        def destroy; end

        private

        def index_data
          ::Muffon::Profile::Posts.call(
            params.slice(
              *%i[
                profile_id
                token
                other_profile_id
                page
                limit
                order
              ]
            )
          )
        end

        def create_data
          ::Muffon::Processor::Profile::Post::Creator.call(
            params.slice(
              *%i[
                profile_id
                token
                other_profile_id
                text
              ],
              *sendable_attachment_types
            )
          )
        end

        def update_data
          ::Muffon::Processor::Profile::Post::Updater.call(
            params.slice(
              *%i[
                profile_id
                token
                post_id
                text
              ],
              *sendable_attachment_types
            )
          )
        end

        def destroy_data
          ::Muffon::Processor::Profile::Post::Destroyer.call(
            params.slice(
              *%i[
                profile_id
                token
                post_id
              ]
            )
          )
        end
      end
    end
  end
end
