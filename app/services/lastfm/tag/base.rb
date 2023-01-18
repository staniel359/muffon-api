module LastFM
  module Tag
    class Base < LastFM::Base
      private

      def primary_args
        [@args[:tag]]
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
