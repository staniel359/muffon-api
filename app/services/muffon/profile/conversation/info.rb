module Muffon
  module Profile
    module Conversation
      class Info < Muffon::Profile::Conversation::Base
        private

        def conversation_data
          {
            id: conversation.id,
            profile: conversation_other_profile_data
          }
        end

        def conversation_other_profile_data
          {
            id: conversation_other_profile.id,
            nickname: conversation_other_profile.nickname,
            image: conversation_other_profile.image_data
          }
        end

        def conversation_other_profile
          @conversation_other_profile ||=
            conversation.find_other_profile(
              @args[:profile_id]
            )
        end
      end
    end
  end
end
