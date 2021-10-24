module Muffon
  module Profile
    module Library
      module Artist
        class Tracks < Muffon::Profile::Library::Artist::Base
          include Muffon::Utils::Pagination

          private

          def artist_data
            {
              name: name,
              page: page,
              total_pages: total_pages_count,
              tracks: tracks_formatted
            }
          end

          def total_items_count
            profile_artist.profile_tracks_count
          end

          def tracks_formatted
            tracks_paginated.map do |a|
              track_data_formatted(a)
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
            profile_artist
              .profile_tracks
              .includes(
                [track: :artist],
                [profile_album: :album],
                [profile_album: [
                  image_attachment: :blob
                ]]
              )
          end

          def track_data_formatted(track)
            Muffon::Profile::Library::Artist::Tracks::Track.call(
              track: track,
              profile_id: @args.profile_id
            )
          end
        end
      end
    end
  end
end
