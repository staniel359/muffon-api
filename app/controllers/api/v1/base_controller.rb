module API
  module V1
    class BaseController < ApplicationController
      PERMITTED_PARAMS = %i[
        access_hash
        album
        album_id
        album_type
        artist
        artist_id
        group_id
        label
        label_id
        limit
        next_page
        offset
        owner_id
        page
        query
        tag
        track
        track_id
      ].freeze

      private

      def render_data_with_status
        render(
          {
            json: data,
            status: status
          }
        )
      end

      def data
        @data ||= data_service&.call(data_args)
      end

      def data_service
        Muffon::Utils::API::Service.call(
          params.slice(:controller, :action)
        )
      end

      def data_args
        params.slice(*PERMITTED_PARAMS)
      end

      def status
        return 204 if data.blank?

        data.dig(:error, :code) || 200
      end
    end
  end
end
