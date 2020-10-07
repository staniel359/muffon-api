module LastFM
  module Tag
    class Info < LastFM::API
      private

      def primary_args
        [@args.tag]
      end

      def no_data?
        super || parsed_response['total'].zero?
      end

      def parsed_response
        @parsed_response ||= JSON.parse(
          api_response('tag.getInfo')
        )['tag']
      end

      def data
        { tag: tag_data }
      end

      def tag_data
        {
          name: parsed_response['name'],
          taggings_count: parsed_response['total'],
          taggers_count: parsed_response['reach'],
          description: description
        }
      end

      def description
        return '' if parsed_response.dig('wiki', 'content').blank?

        parsed_response.dig('wiki', 'content').match(
          %r{(.+)<a href="http(s?)://www.last.fm}m
        )[1].strip
      end
    end
  end
end
