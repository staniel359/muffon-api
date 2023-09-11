module Muffon
  module Processor
    module Post
      module Comment
        class Updater < Muffon::Processor::Post::Comment::Base
          private

          def primary_args
            super + [
              @args[:comment_id]
            ] + content_args
          end

          def no_data?
            super || post_comment.blank?
          end

          def process_post_comment
            update_post_comment

            return post_comment.errors_data if
                post_comment.errors?

            process_images

            { comment: post_comment_data }
          end

          def update_post_comment
            post_comment.update(
              post_comment_params
            )
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
