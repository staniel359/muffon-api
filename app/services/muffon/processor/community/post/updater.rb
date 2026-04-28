module Muffon
  module Processor
    module Community
      module Post
        class Updater < Muffon::Processor::Post::Updater
          private

          def required_args
            [
              *super,
              :community_id
            ]
          end

          def forbidden?
            super || !post_creator?
          end

          def post_params
            {
              **super,
              by_community: by_community?
            }
          end
        end
      end
    end
  end
end
