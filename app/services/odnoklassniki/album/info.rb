module Odnoklassniki
  module Album
    class Info < Odnoklassniki::Base
      private

      def primary_args
        [@args.album_id]
      end

      def endpoint_name
        'album'
      end

      def params
        super.merge({ albumId: @args.album_id })
      end

      def data
        { album: album_data }
      end

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

      def album
        response_data['album']
      end

      def title
        album['name']
      end

      def album_extra_data
        {
          images: images_data(album, 'album'),
          released: released(album),
          tags: tags,
          tracks: tracks_data
        }
      end

      def tags
        album['genres'].map { |t| t['label'] }
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
