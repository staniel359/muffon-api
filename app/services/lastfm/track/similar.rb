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
        if @args[:minimal]
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
          track_title: @args[:track_title],
          artist_name: @args[:artist_name]
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
        track['track']
      end

      def track
        response_data['similartracks']
      end

      def params
        {
          **super,
          limit: PAGE_LIMIT
        }
      end

      def collection_item_data_formatted(track)
        LastFM::Track::Similar::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token],
          minimal: @args[:minimal]
        )
      end
    end
  end
end
