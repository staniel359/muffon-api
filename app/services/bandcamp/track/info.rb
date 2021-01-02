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
          id: track_id(artist_name, track_title),
          title: track_title,
          artist: artist_name
        }
      end

      def artist_name
        base_data.dig('byArtist', 'name')
      end

      def track_title
        base_data['name']
      end

      def track_extra_data
        {
          album: base_data.dig('inAlbum', 'name'),
          images: images,
          length: base_data['duration_secs'].floor,
          audio: audio_data
        }
      end

      def audio_data
        {
          present: audio_link.present?,
          link: audio_link,
          source: 'bandcamp'
        }
      end

      def audio_link
        tracks_data.dig(0, 'file', 'mp3-128')
      end
    end
  end
end
