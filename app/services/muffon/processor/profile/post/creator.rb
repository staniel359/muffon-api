module Muffon
  module Processor
    module Profile
      module Post
        class Creator < Muffon::Processor::Post::Creator
          private

          def primary_args
            super + [
              @args[:other_profile_id]
            ]
          end

          def no_data?
            super || other_profile.blank?
          end

          def post_params
            super.merge(
              other_profile_params
            )
          end

          def other_profile_params
            {
              other_profile_id:
                @args[:other_profile_id],
              post_type: 'profile'
            }
          end
        end
      end
    end
  end
end
