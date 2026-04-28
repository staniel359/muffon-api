module Muffon
  module Processor
    module Community
      module Member
        class Creator < Muffon::Processor::Community::Member::Base
          private

          def process_membership!
            community_record.add_member!(
              profile_id: @args[:profile_id]
            )
          end
        end
      end
    end
  end
end
