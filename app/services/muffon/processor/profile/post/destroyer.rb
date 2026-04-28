module Muffon
  module Processor
    module Profile
      module Post
        class Destroyer < Muffon::Processor::Post::Destroyer
          private

          def forbidden?
            super || !(
              post_creator? ||
                page_creator?
            )
          end
        end
      end
    end
  end
end
