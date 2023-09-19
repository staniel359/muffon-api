module MusixMatch
  module Album
    class Base < MusixMatch::Base
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
        { album_id: @args[:album_id] }
      end

      def data
        { album: album_data }
      end
    end
  end
end
