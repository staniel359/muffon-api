module Muffon
  module Processor
    module Profile
      module Follower
        class Base < Muffon::Processor::Profile::Base
          private

          def required_args
            [
              *super,
              :other_profile_id
            ]
          end

          def other_profile_data
            { followers_count: }
          end

          def followers_count
            other_profile_record
              .reload
              .followers_count
          end
        end
      end
    end
  end
end
