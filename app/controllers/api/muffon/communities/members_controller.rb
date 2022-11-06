module API
  module Muffon
    module Communities
      class MembersController < API::Muffon::CommunitiesController
        def index; end

        def create; end

        def destroy; end

        private

        def index_data
          ::Muffon::Community::Members.call(
            params.slice(
              *%i[community_id profile_id token page limit]
            )
          )
        end

        def create_data
          ::Muffon::Processor::Community::Member::Creator.call(
            params.slice(
              *%i[profile_id token community_id]
            )
          )
        end

        def destroy_data
          ::Muffon::Processor::Community::Member::Destroyer.call(
            params.slice(
              *%i[profile_id token community_id]
            )
          )
        end
      end
    end
  end
end
