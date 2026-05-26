module Muffon
  module Processor
    module Post
      module Comment
        class Destroyer < Muffon::Processor::Post::Comment::Base
          private

          def required_args
            [
              *super,
              :comment_id
            ]
          end

          def not_found?
            super || post_comment_record.blank?
          end

          def data
            post_comment_record.destroy!

            { success: true }
          end
        end
      end
    end
  end
end
