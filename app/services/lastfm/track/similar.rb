module LastFM
  module Track
    class Similar < LastFM::API
      private

      def service_info
        {
          api_method: 'track.getSimilar',
          response_data_node: 'similartracks'
        }
      end

      def primary_args
        [@args.artist, @args.track]
      end

      def limit
        250
      end

      def data
        { track: track_data }
      end

      def track_data
        {
          title: @args.track,
          artist: artist,
          page: similar_paginated[:page],
          total_pages: similar_paginated[:total_pages],
          similar: similar
        }
      end

      def artist
        response_data.dig('@attr', 'artist')
      end

      def similar_paginated
        @similar_paginated ||= LastFM::Utils::Paginated.call(
          collection: response_data['track'],
          page: @args.page,
          limit: @args.limit
        )
      end

      def similar
        similar_paginated[:collection].map do |t|
          similar_track_data(t)
        end
      end

      def similar_track_data(track)
        LastFM::Track::Similar::Track.call(similar: track)
      end
    end
  end
end
