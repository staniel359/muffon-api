module Muffon
  module Processor
    module Community
      module Member
        class Base < Muffon::Profile::Base
          private

          def primary_args
            [
              @args[:profile_id],
              @args[:token],
              @args[:community_id]
            ]
          end

          def data
            return forbidden if wrong_profile?

            process_membership
          end

          def community
            Community.find_by(
              id: @args[:community_id]
            )
          end
        end
      end
    end
  end
end
