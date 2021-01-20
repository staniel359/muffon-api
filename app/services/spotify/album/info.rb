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
          artist: artist_name(response_data),
          source: 'spotify'
        }
      end

      def album_extra_data
        {
          images: images(response_data, 'album'),
          released: released,
          label: response_data['label'],
          tags: response_data['genres'],
          tracks: tracks
        }
      end

      def released
        time_formatted(response_data['release_date'])
      end

      def tracks
        response_data.dig('tracks', 'items').map do |t|
          {
            title: t['name'],
            length: length(t),
            audio: audio_data(t)
          }
        end
      end
    end
  end
end
