module Muffon
  module Profile
    module Library
      module Search
        class Artists < Muffon::Profile::Library::Search::Base
          COLLECTION_NAME = 'artists'.freeze

          private

          def total_items_count
            artists.size
          end

          def artists
            @artists ||=
              artists_joined.where(
                'LOWER(artists.name) LIKE :query',
                query: "%#{@args[:query].downcase}%"
              )
          end

          def artists_joined
            profile
              .profile_artists
              .left_joins(:artist)
          end

          def collection
            artists_paginated.map do |a|
              artist_formatted(a)
            end
          end

          def artists_paginated
            artists_sorted
              .limit(limit)
              .offset(offset)
          end

          def artists_sorted
            artists_associated
              .order(
                profile_tracks_count: :desc,
                created_at: :asc
              )
          end

          def artists_associated
            artists.includes(
              :artist
            )
          end

          def artist_formatted(artist)
            Muffon::Profile::Library::Artists::Artist.call(
              artist: artist,
              profile_id: @args[:profile_id]
            )
          end
        end
      end
    end
  end
end
