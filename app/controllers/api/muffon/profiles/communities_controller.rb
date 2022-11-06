module API
  module Muffon
    module Profiles
      class CommunitiesController < API::Muffon::ProfilesController
        def index; end

        private

        def index_data
          ::Muffon::Profile::Communities.call(
            params.slice(
              *%i[
                profile_id other_profile_id
                token page limit order
              ]
            )
          )
        end
      end
    end
  end
end
