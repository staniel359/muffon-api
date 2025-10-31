module API
  module Muffon
    module Profiles
      class MessagesController < API::Muffon::ProfilesController
        def create; end

        private

        def create_data
          ::Muffon::Processor::Profile::Message::Creator.call(
            params.slice(
              *%i[
                profile_id
                token
                other_profile_id
                text
              ],
              *sendable_attachment_types
            )
          )
        end
      end
    end
  end
end
