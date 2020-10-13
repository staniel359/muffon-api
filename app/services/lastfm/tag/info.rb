module LastFM
  module Tag
    class Info < LastFM::API
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
          taggings_count: response_data['total'],
          taggers_count: response_data['reach'],
          description: description
        }
      end

      def description
        return '' if response_data.dig('wiki', 'content').blank?

        response_data.dig('wiki', 'content').match(
          %r{(.+)<a href="http(s?)://www.last.fm}m
        )[1].strip
      end
    end
  end
end
