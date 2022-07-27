module API
  module Muffon
    class ProfilesController < API::BaseController
      include ActiveStorage::SetCurrent

      def index
        render_data_with_status
      end

      def create
        render_data_with_status
      end

      def info
        render_data_with_status
      end

      def update
        render_data_with_status
      end

      def online
        render_data_with_status
      end

      def playing
        render_data_with_status
      end

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
            *::Muffon::Profile::Base::PARAMS
          )
        )
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
            *::Muffon::Profile::Base::PARAMS
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
