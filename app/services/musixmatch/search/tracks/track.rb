module MusixMatch
  module Search
    class Tracks
      class Track < MusixMatch::Search::Tracks
        include MusixMatch::Utils::Track

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_track_data
          ]
        end

        def data
          {
            **self_data,
            source: source_data,
            player_id: player_source_id,
            title:,
            artist: artists_minimal_data,
            artists:,
            album: album_data,
            image: image_data
          }.compact
        end

        def raw_track_data
          @args[:raw_track_data]
        end

        def title
          raw_track_data['track_name']
        end

        def artist_name
          raw_track_data['artist_name']
        end

        def musixmatch_slug
          raw_track_data['commontrack_vanity_id']
        end

        def album_title
          raw_track_data['album_name']
        end

        def musixmatch_album_slug
          raw_track_data['album_vanity_id']
        end

        def raw_image
          raw_track_data['album_coverart_500x500']
        end
      end
    end
  end
end
