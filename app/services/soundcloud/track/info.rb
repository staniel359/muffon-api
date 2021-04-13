module SoundCloud
  module Track
    class Info < SoundCloud::Base
      private

      def primary_args
        [@args.track_id]
      end

      def no_data?
        response_data.blank?
      end

      def link
        "#{base_link}/tracks/#{@args.track_id}"
      end

      def data
        { track: track_data }
      end

      def track_data
        track_base_data.merge(track_extra_data)
      end

      def track_base_data
        {
          id: track_id(artist_name(response_data), title),
          title: title,
          artist: artist_data(response_data)
        }
      end

      def track_extra_data
        {
          image: image_data(response_data, 'track'),
          plays_count: response_data['playback_count'],
          length: length(response_data),
          description: response_data['description'],
          tags: [response_data['genre']],
          audio: audio_data
        }
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
