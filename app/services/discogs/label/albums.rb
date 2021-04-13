module Discogs
  module Label
    class Albums < Discogs::Base
      include Discogs::Paginated

      private

      def primary_args
        [@args.label_id]
      end

      def data
        { label: paginated_data }
      end

      def link
        "#{base_link}/labels/#{@args.label_id}/releases"
      end

      def album_data(album)
        {
          title: album['title'],
          artist: album['artist'],
          image: image_data(album['thumb'], 'album'),
          released: album['year'].to_s,
          discogs_id: album['id']
        }
      end
    end
  end
end
