module Odnoklassniki
  module Album
    class Base < Odnoklassniki::Base
      ENDPOINT_NAME = 'album'.freeze
      include Odnoklassniki::Utils::Album

      private

      def primary_args
        [@args[:album_id]]
      end

      def params
        super.merge(
          album_params
        )
      end

      def album_params
        { albumId: @args[:album_id] }
      end

      def data
        { album: album_data }
      end

      def album
        @album ||=
          response_data['album']
      end
    end
  end
end
