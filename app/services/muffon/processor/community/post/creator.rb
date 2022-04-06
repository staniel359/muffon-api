module Muffon
  module Processor
    module Community
      module Post
        class Creator < Muffon::Processor::Post::Creator
          private

          def primary_args
            super + [
              @args[:community_id]
            ]
          end

          def no_data?
            super || community.blank?
          end

          def rights?
            true
          end

          def post_params
            super.merge(
              community_params
            )
          end

          def community_params
            {
              community_id:
                @args[:community_id],
              by_community: by_community?
            }
          end

          def community_owner?
            profile.own_community_ids.include?(
              @args[:community_id].to_i
            )
          end
        end
      end
    end
  end
end
