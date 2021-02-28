module Odnoklassniki
  module Track
    class Info < Odnoklassniki::Base
      private

      def primary_args
        [@args.track_id]
      end

      def endpoint_name
        'play'
      end

      def params
        super.merge({ tid: @args.track_id })
      end

      def data
        { track: track_data }
      end

      def track_data
        track_base_data.merge(track_extra_data)
      end

      def track_base_data
        {
          id: track_id(artist_name(track), title),
          title: title,
          artist: artist_data(track)
        }
      end

      def track
        response_data['track']
      end

      def title
        track['name']
      end

      def track_extra_data
        {
          album: album_data,
          images: images_data(response_data, 'track'),
          length: track['duration'],
          audio: audio_data
        }
      end

      def album_data
        { title: response_data.dig('albums', 0, 'name') }
      end

      def audio_data
        {
          present: response_data['play'].present?,
          link: audio_link,
          source: 'odnoklassniki'
        }
      end

      def audio_link
        "#{response_data['play']}&clientHash=#{client_hash}"
      end

      def client_hash
        Odnoklassniki::Utils::ClientHash.call(md5: md5_string)
      end

      def md5_string
        Rack::Utils.parse_nested_query(
          response_data['play']
        )['md5']
      end
    end
  end
end
