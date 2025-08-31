module LastFM
  module Tag
    class Base < LastFM::Base
      TOTAL_LIMIT = 10_000

      def call
        check_args

        check_if_not_found

        data
      rescue Faraday::ResourceNotFound
        raise not_found_error
      end

      private

      def required_args
        %i[
          tag_name
        ]
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
