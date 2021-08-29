module API
  module V1
    class ProfilesController < API::V1::BaseController
      include ActiveStorage::SetCurrent

      def index
        render_data_with_status
      end

      def create
        render_data_with_status
      end

      def show
        render_data_with_status
      end

      def update
        render_data_with_status
      end

      private

      def data
        @data ||= send(
          "#{params[:action]}_data"
        )
      end

      def index_data
        Muffon::Profiles.call
      end

      def create_data
        Muffon::Profile::Creator.call(
          create_params
        )
      end

      def create_params
        params.slice(
          *Muffon::Profile::Base::PARAMS
        )
      end

      def show_data
        Muffon::Profile::Info.call(
          params.slice(:profile_id)
        )
      end

      def update_data
        Muffon::Profile::Updater.call(
          update_params
        )
      end

      def update_params
        params.slice(
          *%i[profile_id token],
          *Muffon::Profile::Base::PARAMS
        )
      end
    end
  end
end
