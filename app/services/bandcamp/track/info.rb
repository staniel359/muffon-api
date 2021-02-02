module Bandcamp
  module Track
    class Info < Bandcamp::Base
      private

      def data
        { track: track_data }
      end

      def track_data
        track_base_data.merge(track_extra_data)
      end

      def track_base_data
        {
          id: track_id(artist_name, title),
          title: title,
          artist: artist_data
        }
      end

      def track_extra_data
        {
          album: album_data,
          images: images_data,
          length: length,
          audio: audio_data
        }
      end

      def album_data
        { title: base_data.dig('inAlbum', 'name') }
      end

      def length
        base_data['duration_secs'].floor
      end

      def audio_data
        {
          present: audio_link.present?,
          link: audio_link,
          source: 'bandcamp'
        }
      end

      def audio_link
        tracks_list.dig(0, 'file', 'mp3-128')
      end
    end
  end
end
