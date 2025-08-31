module Muffon
  module Processor
    module Profile
      module Follower
        class Base < Muffon::Processor::Profile::Base
          private

          def required_args
            super + %i[
              other_profile_id
            ]
          end

          def not_found?
            super ||
              other_profile.blank?
          end

          def data
            process_relationship
          end

          def other_profile_data
            { followers_count: }
          end

          def followers_count
            other_profile
              .reload
              .followers_count
          end
        end
      end
    end
  end
end
