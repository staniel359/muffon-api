module API
  module V2
    module Muffon
      module Profiles
        class ConversationsController < API::V2::Muffon::ProfilesController
          def index
            render_data_with_status
          end

          def info
            render_data_with_status
          end

          def messages
            render_data_with_status
          end

          private

          def index_data
            ::Muffon::Profile::Conversations.call(
              params.slice(
                *%i[profile_id token page limit]
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
                *%i[profile_id token conversation_id page limit]
              )
            )
          end
        end
      end
    end
  end
end
