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
            @membership ||=
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
