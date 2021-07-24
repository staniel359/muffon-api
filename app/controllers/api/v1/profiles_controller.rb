module API
  module V1
    class ProfilesController < API::V1::BaseController
      include ActiveStorage::SetCurrent

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
        @data ||= retrieve_data
      end

      def retrieve_data
        case params[:action]
        when 'create'
          creator_data
        when 'show'
          finder_data
        when 'update'
          updater_data
        end
      end

      def creator_data
        Muffon::Profile::Creator.call(
          create_params
        )
      end

      def create_params
        params.slice(
          *Muffon::Profile::Base::PARAMS
        )
      end

      def finder_data
        Muffon::Profile::Finder.call(
          params.slice(:profile_id)
        )
      end

      def updater_data
        Muffon::Profile::Updater.call(
          update_params
        )
      end

      def update_params
        params.slice(
          *Muffon::Profile::Base::PARAMS,
          *%i[profile_id token]
        )
      end
    end
  end
end
