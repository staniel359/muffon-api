module API
  module Muffon
    module Profiles
      class FeedController < API::Muffon::ProfilesController
        def index; end

        private

        def index_data
          ::Muffon::Profile::Feed.call(
            params.slice(
              *%i[
                profile_id token page
                limit order global
              ]
            )
          )
        end
      end
    end
  end
end
