module Muffon
  module Processor
    module Post
      module Comment
        class Creator < Muffon::Processor::Post::Comment::Base
          private

          def required_args
            super +
              content_args
          end

          def process_post_comment
            post_comment

            if post_comment.errors?
              post_comment.errors_data
            else
              process_images

              { comment: comment_data }
            end
          end

          def post_comment
            @post_comment ||=
              profile
              .own_post_comments
              .create(
                post_comment_params
              )
          end

          def comment_data
            Muffon::Post::Comments::Comment.call(
              comment: post_comment
            )
          end
        end
      end
    end
  end
end
