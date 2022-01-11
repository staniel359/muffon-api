module Muffon
  module Processor
    module Community
      module Member
        class Creator < Muffon::Processor::Community::Member::Base
          private

          def process_membership
            membership

            return membership.errors_data if
                membership.errors?

            { community_members_count:
              community.members_count }
          end

          def membership
            @membership ||=
              profile.memberships.where(
                community_id:
                  @args[:community_id]
              ).first_or_create
          end
        end
      end
    end
  end
end
