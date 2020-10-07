module LastFM
  module Common
    class Tags < LastFM::API
      private

      def parsed_response
        @parsed_response ||= JSON.parse(
          api_response("#{@args.model}.getTopTags")
        )['toptags']
      end

      def data
        { tags: tags_data }
      end

      def tags_data
        {
          artist: parsed_response['@attr']['artist'],
          album: add_data_if_model('album'),
          track: add_data_if_model('track'),
          tags: tags
        }.compact
      end

      def add_data_if_model(model)
        parsed_response['@attr'][model] if @args.model == model
      end

      def tags
        parsed_response['tag'].map do |t|
          {
            name: t['name'],
            count: t['count']
          }
        end
      end
    end
  end
end
