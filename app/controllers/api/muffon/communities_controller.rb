module API
  module Muffon
    class CommunitiesController < API::BaseController
      def index; end

      def create; end

      def info; end

      def update; end

      def destroy; end

      private

      def index_data
        ::Muffon::Communities.call(
          params.slice(
            *%i[profile_id page limit order]
          )
        )
      end

      def create_data
        ::Muffon::Processor::Community::Creator.call(
          params.slice(
            *%i[
              profile_id token title
              description image
            ]
          )
        )
      end

      def info_data
        ::Muffon::Community::Info.call(
          params.slice(
            *%i[community_id profile_id]
          )
        )
      end

      def update_data
        ::Muffon::Processor::Community::Updater.call(
          params.slice(
            *%i[
              community_id profile_id token
              title description image
            ]
          )
        )
      end

      def destroy_data
        ::Muffon::Processor::Community::Destroyer.call(
          params.slice(
            *%i[community_id profile_id token]
          )
        )
      end
    end
  end
end
