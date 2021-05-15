module Odnoklassniki
  module Album
    class Base < Odnoklassniki::Base
      private

      def primary_args
        [@args.album_id]
      end

      def endpoint_name
        'album'
      end

      def params
        super.merge({ albumId: @args.album_id })
      end

      def data
        { album: album_data }
      end

      def album
        response_data['album']
      end

      def title
        album['name']
      end

      def tags_list
        album['genres']
      end
    end
  end
end
