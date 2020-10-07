module LastFM
  module Tag
    class Info < LastFM::API
      def call
        return not_found_data if no_data?

        { tag: tag_data }
      rescue RestClient::InternalServerError
        not_found_data if @args.tag.blank?
      end

      private

      def no_data?
        parsed_response.blank? || parsed_response['total'].zero?
      end

      def parsed_response
        @parsed_response ||= JSON.parse(
          api_response('tag.getInfo')
        )['tag']
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
