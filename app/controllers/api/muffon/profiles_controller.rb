module API
  module Muffon
    class ProfilesController < API::BaseController
      def index; end

      def create; end

      def info; end

      def update; end

      def destroy; end

      private

      def index_data
        ::Muffon::Profiles.call(
          params.slice(
            *%i[
              other_profile_id token
              page limit order online
            ]
          )
        )
      end

      def create_data
        ::Muffon::Processor::Profile::Creator.call(
          params.slice(
            *profile_params
          )
        )
      end

      def profile_params
        ::Muffon::Profile::Base::PARAMS
      end

      def info_data
        ::Muffon::Profile::Info.call(
          params.slice(
            *%i[profile_id other_profile_id token]
          )
        )
      end

      def update_data
        ::Muffon::Processor::Profile::Updater.call(
          params.slice(
            *%i[profile_id token],
            *profile_params
          )
        )
      end

      def destroy_data
        ::Muffon::Processor::Profile::Destroyer.call(
          params.slice(
            *%i[profile_id token password]
          )
        )
      end
    end
  end
end
