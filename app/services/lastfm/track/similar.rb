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
          artist: response_data.dig('@attr', 'artist'),
          page: page,
          total_pages: total_pages,
          similar: similar
        }
      end

      def page
        (@args.page || 1).to_i
      end

      def total_pages
        response_data['track'].size.fdiv(page_limit).ceil
      end

      def page_limit
        (@args.limit || 50).to_i
      end

      def similar
        similar_paginated.map { |t| similar_track_data(t) }
      end

      def similar_paginated
        response_data['track'].slice(offset, page_limit) || []
      end

      def offset
        (page - 1) * page_limit
      end

      def similar_track_data(track)
        LastFM::Track::Similar::Track.call(similar: track)
      end

      def track_id(track)
        ::Track.with_artist_id_title(
          artist_id(track), track_title(track)
        ).id
      end

      def artist_id(track)
        ::Artist.with_name(artist_name(track)).id
      end

      def artist_name(track)
        track.dig('artist', 'name')
      end

      def track_title(track)
        track['name']
      end
    end
  end
end
