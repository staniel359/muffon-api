module API
  module Muffon
    module Profiles
      class ConversationsController < API::Muffon::ProfilesController
        def index; end

        def info; end

        def messages; end

        private

        def index_data
          ::Muffon::Profile::Conversations.call(
            params.slice(
              *%i[profile_id token page limit order]
            )
          )
        end

        def info_data
          ::Muffon::Profile::Conversation::Info.call(
            params.slice(
              *%i[profile_id token conversation_id]
            )
          )
        end

        def messages_data
          ::Muffon::Profile::Conversation::Messages.call(
            params.slice(
              *%i[
                profile_id token
                conversation_id
                page limit
              ]
            )
          )
        end
      end
    end
  end
end
