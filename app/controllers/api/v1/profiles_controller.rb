module API
  module V1
    class ProfilesController < API::V1::BaseController
      def create
        render_data_with_status
      end

      def show
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
        end
      end

      def creator_data
        Muffon::Profile::Creator.call(
          create_params
        )
      end

      def create_params
        params.slice(
          *Muffon::Profile::Creator::PARAMS
        )
      end

      def finder_data
        Muffon::Profile::Finder.call(
          params.slice(:token)
        )
      end
    end
  end
end
