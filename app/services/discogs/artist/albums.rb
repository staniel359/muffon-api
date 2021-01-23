module Discogs
  module Artist
    class Albums < Discogs::Base
      include Discogs::Paginated

      private

      def primary_args
        [@args.artist_id]
      end

      def data
        { artist: paginated_data }
      end

      def link
        "#{base_link}/artists/#{@args.artist_id}/releases"
      end

      def album_data(album)
        {
          title: album['title'],
          artist: album['artist'],
          images: images_data(album['thumb'], 'album'),
          released: album['year'].to_s,
          id_key(album) => album['id']
        }
      end

      def id_key(album)
        id_name = album['type'] == 'master' ? 'group_id' : 'id'

        "discogs_#{id_name}".to_sym
      end
    end
  end
end
