module API
  module Muffon
    module Communities
      module Posts
        class CommentsController < API::Muffon::Communities::PostsController
          def index; end

          def create; end

          def update; end

          def destroy; end

          private

          def index_data
            ::Muffon::Community::Post::Comments.call(
              params.slice(
                *%i[
                  community_id
                  post_id
                  page
                  limit
                  order
                ]
              )
            )
          end

          def create_data
            ::Muffon::Processor::Community::Post::Comment::Creator.call(
              params.slice(
                *%i[
                  other_profile_id
                  token
                  community_id
                  post_id
                  by_community
                  text
                ],
                *sendable_attachment_types
              )
            )
          end

          def update_data
            ::Muffon::Processor::Community::Post::Comment::Updater.call(
              params.slice(
                *%i[
                  other_profile_id
                  token
                  community_id
                  post_id
                  comment_id
                  by_community
                  text
                ],
                *sendable_attachment_types
              )
            )
          end

          def destroy_data
            ::Muffon::Processor::Community::Post::Comment::Destroyer.call(
              params.slice(
                *%i[
                  other_profile_id
                  token
                  community_id
                  post_id
                  comment_id
                ]
              )
            )
          end
        end
      end
    end
  end
end
