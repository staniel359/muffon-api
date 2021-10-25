module Muffon
  module Profile
    module Library
      module Search
        class Tracks < Muffon::Profile::Library::Search::Base
          private

          def library_data
            {
              page: page,
              total_pages: total_pages_count,
              tracks: tracks_formatted
            }
          end

          def total_items_count
            tracks.size
          end

          def tracks
            @tracks ||=
              tracks_joined.where(
                'LOWER(tracks.title) LIKE :query '\
                'OR LOWER(artists.name) LIKE :query',
                query: "%#{@args.query.downcase}%"
              )
          end

          def tracks_joined
            profile
              .profile_tracks
              .left_joins(track: :artist)
          end

          def tracks_formatted
            tracks_paginated.map do |t|
              track_formatted(t)
            end
          end

          def tracks_paginated
            tracks_sorted
              .limit(limit)
              .offset(offset)
          end

          def tracks_sorted
            tracks_associated.order(
              created_at: :desc
            )
          end

          def tracks_associated
            tracks
              .includes(
                :track,
                [profile_artist: :artist],
                [profile_album: :album],
                [profile_album: [
                  image_attachment: :blob
                ]]
              )
          end

          def track_formatted(track)
            Muffon::Profile::Library::Tracks::Track.call(
              track: track,
              profile_id: @args.profile_id
            )
          end
        end
      end
    end
  end
end
