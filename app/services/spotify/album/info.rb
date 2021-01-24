module Spotify
  module Album
    class Info < Spotify::Base
      private

      def primary_args
        [@args.album_id]
      end

      def no_data?
        response_data.blank?
      end

      def link
        "#{base_link}/albums/#{@args.album_id}"
      end

      def data
        { album: album_data }
      end

      def album_data
        album_base_data.merge(album_extra_data)
      end

      def album_base_data
        {
          title: response_data['name'],
          artist: artist_data(response_data),
          source: 'spotify'
        }
      end

      def album_extra_data
        {
          images: images_data(response_data, 'album'),
          released: released,
          labels: [response_data['label']],
          tags: response_data['genres'],
          tracks: tracks_data
        }
      end

      def released
        time_formatted(response_data['release_date'])
      end

      def tracks_data
        tracks_list.map { |t| track_data(t) }
      end

      def tracks_list
        response_data.dig('tracks', 'items')
      end

      def track_data(track)
        {
          title: track['name'],
          length: length(track),
          audio: audio_data(track)
        }
      end
    end
  end
end
