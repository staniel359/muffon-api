module Muffon
  module Processor
    module Community
      module Post
        class Destroyer < Muffon::Processor::Post::Destroyer
          private

          def required_args
            [
              *super,
              :community_id
            ]
          end

          def forbidden?
            super || !(
              post_creator? ||
                community_creator?
            )
          end
        end
      end
    end
  end
end
