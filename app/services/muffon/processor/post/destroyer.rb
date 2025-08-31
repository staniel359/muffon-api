module Muffon
  module Processor
    module Post
      class Destroyer < Muffon::Processor::Post::Base
        private

        def required_args
          super + %i[
            post_id
          ]
        end

        def not_found?
          super ||
            post.blank?
        end

        def process_post
          post&.destroy

          { success: true }
        end
      end
    end
  end
end
