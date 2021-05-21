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
          title: title,
          artist: artist_data(response_data),
          source: 'spotify'
        }
      end

      def album_extra_data
        {
          image: image_data(response_data, 'album'),
          released: date_formatted(response_data['release_date']),
          labels: [response_data['label']],
          tracks: tracks_data
        }
      end

      def tracks_data
        tracks_list.map { |t| track_data(t) }
      end

      def tracks_list
        response_data.dig('tracks', 'items')
      end

      def track_data(track)
        {
          id: track_id(artist_name(track), track['name']),
          title: track['name'],
          artist: artist_data(track),
          length: length(track),
          audio: audio_data(track)
        }
      end
    end
  end
end
