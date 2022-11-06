module Muffon
  module Processor
    module Community
      module Post
        class Updater < Muffon::Processor::Post::Updater
          private

          def primary_args
            super + [
              @args[:community_id]
            ]
          end

          def no_data?
            super || community.blank?
          end

          def forbidden?
            super || !post_creator?
          end

          def post_params
            super.merge(
              community_params
            )
          end

          def community_params
            { by_community: by_community? }
          end
        end
      end
    end
  end
end
