module LastFM
  module Common
    class Tags < LastFM::API
      private

      def service_info
        {
          api_method: "#{@args.model}.getTopTags",
          response_data_node: 'toptags'
        }
      end

      def primary_args
        [
          @args.model, @args.artist,
          @args.send(@args.model.to_s)
        ]
      end

      def data
        { tags: tags_data }
      end

      def tags_data
        {
          artist: response_data['@attr']['artist'],
          album: add_data_if_model('album'),
          track: add_data_if_model('track'),
          tags: tags
        }.compact
      end

      def add_data_if_model(model)
        response_data['@attr'][model] if @args.model == model
      end

      def tags
        response_data['tag'].map do |t|
          {
            name: t['name'],
            count: t['count']
          }
        end
      end
    end
  end
end
