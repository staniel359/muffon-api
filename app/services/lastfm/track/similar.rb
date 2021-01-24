module LastFM
  module Track
    class Similar < LastFM::Track::Base
      include LastFM::API::Paginated

      private

      def service_info
        {
          api_method: 'track.getSimilar',
          response_data_node: 'similartracks'
        }
      end

      def params
        super.merge(pagination_params)
      end

      def track_data
        {
          title: @args.track,
          artist: artist_data,
          page: page,
          total_pages: total_pages,
          similar: collection_data
        }
      end

      def artist_data
        { name: response_data.dig('@attr', 'artist') }
      end

      def raw_collection
        response_data['track']
      end

      def collection_item_data(similar)
        LastFM::Track::Similar::Track.call(similar: similar)
      end
    end
  end
end
