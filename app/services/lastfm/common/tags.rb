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
        send("#{@args.model}_tags_data")
      end

      def artist_tags_data
        {
          artist: {
            name: artist,
            tags: tags
          }
        }
      end

      def artist
        response_data.dig('@attr', 'artist')
      end

      def album_tags_data
        {
          album: {
            title: title('album'),
            artist: artist,
            tags: tags
          }
        }
      end

      def title(model)
        response_data.dig('@attr', model)
      end

      def track_tags_data
        {
          track: {
            title: title('track'),
            artist: artist,
            tags: tags
          }
        }
      end

      def tags
        response_data['tag'].map do |t|
          {
            name: t['name'],
            percent: t['count']
          }
        end
      end
    end
  end
end
