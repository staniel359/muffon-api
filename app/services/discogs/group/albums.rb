module Discogs
  module Group
    class Albums < Discogs::Group::Base
      include Discogs::Paginated

      private

      def group_data
        paginated_data
      end

      def link
        "#{group_link}/versions"
      end

      def album_data(album)
        {
          title: album['title'],
          image: image_data(album['thumb'], 'album'),
          released: album['released'],
          format: album['format'],
          discogs_id: album['id']
        }
      end
    end
  end
end
