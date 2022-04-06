module Muffon
  module Processor
    module Profile
      module Post
        class Destroyer < Muffon::Processor::Post::Destroyer
          private

          def rights?
            post_creator? ||
              page_owner?
          end

          def page_owner?
            post.other_profile_id ==
              @args[:profile_id].to_i
          end
        end
      end
    end
  end
end
