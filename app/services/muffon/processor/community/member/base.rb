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

          def no_data?
            super || community.blank?
          end

          def community
            @community ||=
              ::Community.find_by(
                id: @args[:community_id]
              )
          end

          def forbidden?
            wrong_profile?
          end

          def data
            process_membership
          end

          def community_data
            { members_count: }
          end

          def members_count
            community
              .reload
              .members_count
          end
        end
      end
    end
  end
end
