module Muffon
  module Processor
    module Community
      module Member
        class Creator < Muffon::Processor::Community::Member::Base
          private

          def process_membership
            membership

            return membership.errors_data if membership.errors?

            { community: community_data }
          end

          def membership
            @membership ||=
              community
              .memberships
              .where(
                profile_id: @args[:profile_id]
              ).first_or_create
          end
        end
      end
    end
  end
end
