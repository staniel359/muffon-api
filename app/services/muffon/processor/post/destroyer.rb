module Muffon
  module Processor
    module Post
      class Destroyer < Muffon::Processor::Post::Base
        private

        def primary_args
          super + [
            @args[:post_id]
          ]
        end

        def no_data?
          super || post.blank?
        end

        def process_post
          post&.destroy

          { success: true }
        end
      end
    end
  end
end
