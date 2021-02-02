module Spotify
  module Track
    class Info < Spotify::Base
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
          album: album_data,
          images: images_data(response_data['album'], 'track'),
          length: length(response_data),
          audio: audio_data(response_data)
        }
      end

      def album_data
        { name: response_data.dig('album', 'name') }
      end
    end
  end
end
