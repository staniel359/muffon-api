module LastFM
  module API
    class Base < LastFM::Base
      private

      def no_data?
        response_data.blank?
      end

      def response_data
        @response_data ||= JSON.parse(response)[data_node]
      end

      def link
        'http://ws.audioscrobbler.com/2.0'
      end

      def params
        {
          method: service_info[:api_method],
          api_key: secrets.lastfm[:api_key],
          format: 'json',
          autocorrect: 1
        }
      end

      def artist_params
        {
          artist: format_param(@args.artist)
        }
      end

      def format_param(param)
        param.to_s.strip.presence
      end

      def album_params
        {
          artist: format_param(@args.artist),
          album: format_param(@args.album)
        }
      end

      def track_params
        {
          artist: format_param(@args.artist),
          track: format_param(@args.track)
        }
      end

      def data_node
        service_info[:response_data_node]
      end

      def title
        response_data['name']
      end

      def artist_data
        { name: artist_name }
      end

      def description
        LastFM::Utils::Description.call(data: response_data)
      end
    end
  end
end
