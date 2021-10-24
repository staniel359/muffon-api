module Muffon
  module Profile
    module Library
      class Tracks < Muffon::Profile::Library::Base
        include Muffon::Utils::Pagination

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
