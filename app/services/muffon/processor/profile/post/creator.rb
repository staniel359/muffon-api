module Muffon
  module Processor
    module Profile
      module Post
        class Creator < Muffon::Processor::Post::Creator
          private

          def required_args
            [
              *super,
              :other_profile_id
            ]
          end

          def post_params
            {
              **super,
              other_profile_id: @args[:other_profile_id],
              post_type: 'profile'
            }
          end
        end
      end
    end
  end
end
