module Muffon
  module Processor
    module Community
      module Post
        class Creator < Muffon::Processor::Post::Creator
          private

          def required_args
            super + %i[
              community_id
            ]
          end

          def not_found?
            super ||
              community.blank?
          end

          def post_params
            {
              **super,
              community_id:
                @args[:community_id],
              by_community: by_community?,
              post_type: 'community'
            }
          end
        end
      end
    end
  end
end
