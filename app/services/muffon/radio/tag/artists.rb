module Muffon
  module Radio
    module Tag
      class Artists < Muffon::Radio::Tag::Base
        COLLECTION_NAME = 'artists'.freeze

        private

        def no_track?
          [
            artists,
            artist_data,
            tracks
          ].any?(&:blank?)
        end

        def artists
          @artists ||= tag_data[:artists]
        end

        def artist_data
          @artist_data ||=
            LastFM::Artist::Tracks.call(
              artist: artist_names,
              limit: 1,
              page: rand(1..20)
            )[:artist]
        end

        def tracks
          @tracks ||= artist_data[:tracks]
        end

        def track
          track_base_data
            .merge(track_artist_data)
        end

        def track_base_data
          random_track.slice(
            *%i[player_id source_id title]
          )
        end

        def track_artist_data
          {
            artist: artist_formatted,
            artists: artists
          }
        end
      end
    end
  end
end
