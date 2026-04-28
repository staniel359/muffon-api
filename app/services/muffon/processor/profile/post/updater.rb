module Muffon
  module Processor
    module Profile
      module Post
        class Updater < Muffon::Processor::Post::Updater
          private

          def forbidden?
            super || !post_creator?
          end
        end
      end
    end
  end
end
