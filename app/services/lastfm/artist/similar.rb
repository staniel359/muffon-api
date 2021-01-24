module LastFM
  module Artist
    class Similar < LastFM::Artist::Web::Paginated
      private

      def collection_name
        'similar'
      end

      def collection_data
        return [] if page > total_pages

        similar_list.map { |s| similar_artist_data(s) }
      end

      def similar_list
        response_data.css('.similar-artists-item')
      end

      def similar_artist_data(similar)
        LastFM::Artist::Similar::Artist.call(similar: similar)
      end
    end
  end
end
