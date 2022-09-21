module API
  module Muffon
    class ProfilesController < API::BaseController
      def index; end

      def create; end

      def info; end

      def update; end

      def online; end

      def playing; end

      private

      def index_data
        ::Muffon::Profiles.call(
          params.slice(
            *%i[other_profile_id page limit]
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
            *%i[profile_id token other_profile_id]
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

      def online_data
        ::Muffon::Processor::Profile::Online::Updater.call(
          params.slice(
            *%i[profile_id token online]
          )
        )
      end

      def playing_data
        ::Muffon::Processor::Profile::Playing::Updater.call(
          params.slice(
            *%i[profile_id token playing]
          )
        )
      end
    end
  end
end
