module Muffon
  module Profile
    module Conversation
      class Base < Muffon::Profile::Base
        private

        def primary_args
          [
            @args[:profile_id],
            @args[:token],
            @args[:conversation_id]
          ]
        end

        def no_data?
          conversation.blank?
        end

        def conversation
          @conversation ||=
            profile.conversations.find_by(
              id: @args[:conversation_id]
            )
        end

        def data
          return forbidden if wrong_profile?

          { conversation: conversation_data }
        end
      end
    end
  end
end
