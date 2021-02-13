module LastFM
  module Artist
    class Images < LastFM::Artist::Web::Paginated
      private

      def collection_name
        'images'
      end

      def collection_data
        return [] if page > total_pages

        images_list.map { |i| images_data(i['src'], 'artist') }
      end

      def images_list
        response_data.css('.image-list-item img')
      end
    end
  end
end
