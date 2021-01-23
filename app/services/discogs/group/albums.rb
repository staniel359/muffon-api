module Discogs
  module Group
    class Albums < Discogs::Group::Base
      include Discogs::Paginated

      private

      def data
        { group: paginated_data }
      end

      def link
        "#{group_link}/versions"
      end

      def album_data(album)
        {
          title: album['title'],
          images: images_data(album['thumb'], 'album'),
          released: album['released'],
          format: album['format'],
          discogs_id: album['id']
        }
      end
    end
  end
end
