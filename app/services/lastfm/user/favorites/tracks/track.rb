module LastFM
  module User
    module Favorites
      class Tracks
        class Track < LastFM::User::Favorites::Tracks
          include LastFM::Utils::Track

          def call
            data
          end

          private

          def data
            {
              source: source_data,
              title:,
              artist: artists_minimal_data,
              artists:,
              created: created_formatted
            }.compact
          end

          def title
            track['name']
          end

          def track
            @args[:track]
          end

          def artist_name
            track.dig(
              'artist', 'name'
            )
          end

          def created_formatted
            datetime_formatted(
              raw_created
            )
          end

          def raw_created
            track.dig(
              'date', '#text'
            ).to_datetime
          end
        end
      end
    end
  end
end
