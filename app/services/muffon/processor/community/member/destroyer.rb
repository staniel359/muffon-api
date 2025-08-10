module Muffon
  module Processor
    module Community
      module Member
        class Destroyer < Muffon::Processor::Community::Member::Base
          private

          def process_membership
            membership&.destroy

            { community: community_data }
          end

          def membership
            if instance_variable_defined?(
              :@membership
            )
              @membership
            else
              @membership =
                community
                .memberships
                .find_by(
                  profile_id: @args[:profile_id]
                )
            end
          end
        end
      end
    end
  end
end
