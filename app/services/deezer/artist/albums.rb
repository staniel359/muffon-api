module Deezer
  module Artist
    class Albums < Deezer::Base
      include Deezer::Paginated

      private

      def primary_args
        [@args.artist_id]
      end

      def no_data?
        response_data['data'].blank?
      end

      def link
        "#{base_link}/artist/#{@args.artist_id}/albums"
      end

      def collection_name
        'albums'
      end

      def data
        { artist: paginated_data }
      end

      def collection_item_data(album)
        {
          title: album['title'],
          image: image_data(album, 'album'),
          listeners_count: album['fans'],
          released: date_formatted(album['release_date']),
          deezer_id: album['id']
        }
      end
    end
  end
end
