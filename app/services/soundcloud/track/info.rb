module SoundCloud
  module Track
    class Info < SoundCloud::Base
      private

      def primary_args
        [@args.track_id]
      end

      def link
        "#{base_link}/tracks/#{@args.track_id}"
      end

      def data
        { track: track_data }
      end

      def track_data
        {
          id: track_id(artist_name, title),
          title: title,
          artist: artist_name,
          images: images(response_data, 'track'),
          length: response_data['duration'] / 1_000,
          plays_count: response_data['playback_count'],
          audio: audio_data
        }
      end

      def artist_name
        response_data.dig('user', 'username')
      end

      def title
        response_data['title']
      end

      def audio_data
        {
          present: audio_link.present?,
          link: audio_link,
          source: 'soundcloud'
        }
      end

      def audio_link
        "#{link}/stream?client_id=#{client_id}"
      end
    end
  end
end
