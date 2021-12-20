module Muffon
  module Processor
    module Profile
      module Post
        class Destroyer < Muffon::Processor::Profile::Post::Base
          private

          def primary_args
            super + [
              @args[:post_id]
            ]
          end

          def process_post
            post&.destroy

            { success: true }
          end
        end
      end
    end
  end
end
