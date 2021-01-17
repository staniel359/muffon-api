module LastFM
  module Tag
    class Description < LastFM::API
      private

      def service_info
        {
          api_method: 'tag.getInfo',
          response_data_node: 'tag'
        }
      end

      def primary_args
        [@args.tag]
      end

      def no_data?
        super || response_data['total'].zero?
      end

      def data
        { tag: tag_data }
      end

      def tag_data
        {
          name: response_data['name'],
          description: description
        }
      end
    end
  end
end
