module API
  module Muffon
    module Profiles
      module Posts
        class CommentsController < API::Muffon::Profiles::PostsController
          def index; end

          def create; end

          def update; end

          def destroy; end

          private

          def index_data
            ::Muffon::Profile::Post::Comments.call(
              params.slice(
                *%i[
                  profile_id
                  post_id
                  page
                  limit
                  order
                ]
              )
            )
          end

          def create_data
            ::Muffon::Processor::Profile::Post::Comment::Creator.call(
              params.slice(
                *%i[
                  other_profile_id
                  token
                  post_id
                  text
                ],
                *sendable_attachment_types
              )
            )
          end

          def update_data
            ::Muffon::Processor::Profile::Post::Comment::Updater.call(
              params.slice(
                *%i[
                  other_profile_id
                  token
                  post_id
                  comment_id
                  text
                ],
                *sendable_attachment_types
              )
            )
          end

          def destroy_data
            ::Muffon::Processor::Profile::Post::Comment::Destroyer.call(
              params.slice(
                *%i[
                  other_profile_id
                  token
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
