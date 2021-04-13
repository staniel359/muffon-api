module Odnoklassniki
  module Album
    class Info < Odnoklassniki::Album::Base
      private

      def album_data
        album_base_data.merge(album_extra_data)
      end

      def album_base_data
        {
          id: album_id(artist_name(album), title),
          title: title,
          artist: artist_data(album),
          source: 'odnoklassniki'
        }
      end

      def album_extra_data
        {
          image: image_data(album, 'album'),
          released: released(album),
          tags: tags.first(5),
          tracks: tracks_data
        }
      end

      def tracks_data
        tracks_list.map { |t| track_data(t) }
      end

      def tracks_list
        response_data['tracks']
      end

      def track_data(track)
        {
          id: track_id(artist_name(track), track['name']),
          title: track['name'],
          artist: artist_data(track),
          length: track['duration'],
          audio: audio_data(track)
        }
      end
    end
  end
end
