module Muffon
  module Profile
    module Conversation
      class Info < Muffon::Profile::Conversation::Base
        private

        def conversation_data
          {
            id: conversation.id,
            profile: other_profile_data
          }
        end

        def other_profile_data
          {
            id: other_profile.id,
            nickname: other_profile.nickname,
            image: other_profile.image_data
          }
        end

        def other_profile
          @other_profile ||=
            conversation.find_other_profile(
              @args[:profile_id]
            )
        end
      end
    end
  end
end
