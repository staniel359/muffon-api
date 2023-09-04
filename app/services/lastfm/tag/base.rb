module LastFM
  module Tag
    class Base < LastFM::Base
      TOTAL_LIMIT = 10_000

      private

      def primary_args
        [@args[:tag_name]]
      end

      def params
        super.merge(
          tag_params
        )
      end

      def data
        { tag: tag_data }
      end
    end
  end
end
