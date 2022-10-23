module API
  module Muffon
    module Communities
      class PostsController < API::Muffon::CommunitiesController
        def index; end

        def create; end

        def update; end

        def destroy; end

        private

        def index_data
          ::Muffon::Community::Posts.call(
            params.slice(
              *%i[community_id page limit order]
            )
          )
        end

        def create_data
          ::Muffon::Processor::Community::Post::Creator.call(
            params.slice(
              *%i[
                community_id profile_id
                token by_community text
              ],
              *sendable_attachment_types
            )
          )
        end

        def update_data
          ::Muffon::Processor::Community::Post::Updater.call(
            params.slice(
              *%i[
                community_id post_id profile_id
                token by_community text
              ],
              *sendable_attachment_types
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
