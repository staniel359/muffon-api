module Muffon
  module Processor
    module Profile
      module Follower
        class Base < Muffon::Profile::Base
          private

          def primary_args
            [
              @args[:profile_id],
              @args[:token],
              @args[:other_profile_id]
            ]
          end

          def no_data?
            super || other_profile.blank?
          end

          def forbidden?
            !valid_profile?
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
