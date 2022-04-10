module Muffon
  module Processor
    module Community
      module Member
        class Destroyer < Muffon::Processor::Community::Member::Base
          private

          def process_membership
            membership&.destroy

            { community_members_count: }
          end

          def membership
            @membership ||=
              profile.memberships.find_by(
                community_id:
                  @args[:community_id]
              )
          end

          def community_members_count
            community
              .reload
              .members_count
          end
        end
      end
    end
  end
end
