module Bandcamp
  module Track
    class Info < Bandcamp::Base
      private

      def data
        { track: track_data }
      end

      def track_data
        {
          title: base_data['name'],
          artist: base_data.dig('byArtist', 'name'),
          album: base_data.dig('inAlbum', 'name'),
          images: images,
          length: base_data['duration_secs'].floor,
          audio_link: tracks_data.dig(0, 'file', 'mp3-128')
        }
      end
    end
  end
end
