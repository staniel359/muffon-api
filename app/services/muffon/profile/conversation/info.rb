module Muffon
  module Profile
    module Conversation
      class Info < Muffon::Profile::Conversation::Base
        private

        def conversation_data
          {
            id: conversation_id,
            profile: conversation_other_profile_data
          }
        end

        def conversation_id
          conversation.id
        end

        def conversation_other_profile_data
          {
            id: conversation_other_profile_id,
            nickname: conversation_other_profile_nickname,
            image: conversation_other_profile_image_data
          }
        end

        def conversation_other_profile_id
          conversation_other_profile.id
        end

        def conversation_other_profile
          @conversation_other_profile ||=
            conversation.find_other_profile(
              @args[:profile_id]
            )
        end

        def conversation_other_profile_nickname
          conversation_other_profile.nickname
        end

        def conversation_other_profile_image_data
          conversation_other_profile.image_data
        end
      end
    end
  end
end
