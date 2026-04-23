module LastFM
  module Track
    class Similar < LastFM::Track::Base
      API_METHOD = 'track.getSimilar'.freeze
      PAGE_LIMIT = 200

      private

      def track_data
        {
          **track_info_data_computed,
          **similar_data
        }
      end

      def track_info_data_computed
        if @args[:is_minimal]
          {}
        else
          track_info_data.slice(
            :title,
            :artist,
            :artists
          )
        end
      end

      def track_info_data
        LastFM::Track::Info.call(
          artist_name: @args[:artist_name],
          track_title: @args[:track_title]
        )[:track]
      end

      def similar_data
        paginated_data(
          collection_name: 'similar',
          raw_collection:,
          page:,
          limit:,
          is_fractioned: true
        )
      end

      def raw_collection
        raw_track_data['track']
      end

      def raw_track_data
        response_data['similartracks']
      end

      def params
        {
          **super,
          limit: PAGE_LIMIT
        }
      end

      def collection_item_data_formatted(
        raw_track_data
      )
        LastFM::Track::Similar::Track.call(
          raw_track_data:,
          is_minimal: @args[:is_minimal],
          **self_args
        )
      end
    end
  end
end
