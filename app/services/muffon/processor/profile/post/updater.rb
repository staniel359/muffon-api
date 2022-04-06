module Muffon
  module Processor
    module Profile
      module Post
        class Updater < Muffon::Processor::Post::Updater
          private

          def rights?
            post_creator?
          end
        end
      end
    end
  end
end
