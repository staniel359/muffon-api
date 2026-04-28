module Muffon
  module Processor
    module Community
      module Member
        class Base < Muffon::Processor::Profile::Base
          private

          def required_args
            [
              *super,
              :community_id
            ]
          end

          def community_record
            if defined?(@community_record)
              @community_record
            else
              @community_record =
                ::Community.find_by(
                  id: @args[:community_id]
                )
            end
          end

          def data
            process_membership!

            { community: community_data }
          end

          def community_data
            { members_count: }
          end

          def members_count
            community_record
              .reload
              .members_count
          end
        end
      end
    end
  end
end
