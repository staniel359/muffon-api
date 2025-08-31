module Muffon
  module Processor
    module Post
      module Comment
        class Updater < Muffon::Processor::Post::Comment::Base
          private

          def required_args
            super +
              content_args +
              %i[
                comment_id
              ]
          end

          def not_found?
            super ||
              post_comment.blank?
          end

          def process_post_comment
            post_comment.update(
              post_comment_params
            )

            if post_comment.errors?
              post_comment.errors_data
            else
              process_images

              { comment: post_comment_data }
            end
          end

          def post_comment_data
            Muffon::Post::Comments::Comment.call(
              comment: post_comment
            )
          end
        end
      end
    end
  end
end
