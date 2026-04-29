module Muffon
  module Profile
    module Conversation
      class Info < Muffon::Profile::Conversation::Base
        private

        def conversation_data
          {
            id: conversation_record.id,
            profile: other_profile_data
          }
        end

        def other_profile_data
          return {} if other_profile_record.blank?

          {
            id: other_profile_record.id,
            nickname: other_profile_record.nickname,
            image: other_profile_record.image_data
          }.compact
        end

        def other_profile_record
          @other_profile_record ||=
            conversation_record.detect_other_profile(
              profile_id: @args[:profile_id]
            )
        end
      end
    end
  end
end
