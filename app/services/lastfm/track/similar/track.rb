module LastFM
  module Track
    class Similar
      class Track < LastFM::Track::Similar
        def call
          similar_track_data
        end

        private

        def primary_args
          [@args.similar]
        end

        def similar_track_data
          {
            id: track_id,
            title: track_title,
            artist: artist_name,
            length: @args.similar['duration'] || 0
          }
        end

        def track_id
          ::Track.with_artist_id_title(artist_id, track_title).id
        end

        def artist_id
          ::Artist.with_name(artist_name).id
        end

        def artist_name
          @args.similar.dig('artist', 'name')
        end

        def track_title
          @args.similar['name']
        end
      end
    end
  end
end
