module Muffon
  module Processor
    module Profile
      module Post
        class Destroyer < Muffon::Processor::Post::Destroyer
          private

          def forbidden?
            !post_creator? && !page_owner?
          end

          def page_owner?
            post.other_profile_id == profile.id
          end
        end
      end
    end
  end
end
