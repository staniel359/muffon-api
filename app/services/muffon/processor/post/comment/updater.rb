module Muffon
  module Processor
    module Post
      module Comment
        class Updater < Muffon::Processor::Post::Comment::Base
          private

          def required_args
            [
              *super,
              *content_args,
              :comment_id
            ]
          end

          def data
            post_comment_record.update(
              post_comment_params
            )

            if post_comment_record.errors?
              post_comment_record.errors_data
            else
              post_comment_record.process_images(
                @args[:images]
              )

              { comment: post_comment_data }
            end
          end

          def post_comment_data
            Muffon::Formatter::Post::Comments::Comment.call(
              comment_record: post_comment_record,
              **self_args
            )
          end
        end
      end
    end
  end
end
