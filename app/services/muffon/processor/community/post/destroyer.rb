module Muffon
  module Processor
    module Community
      module Post
        class Destroyer < Muffon::Processor::Post::Destroyer
          private

          def primary_args
            super + [
              @args[:community_id]
            ]
          end

          def forbidden?
            super || !post_creator? || !community_owner?
          end
        end
      end
    end
  end
end
