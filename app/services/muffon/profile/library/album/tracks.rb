module Muffon
  module Profile
    module Library
      module Album
        class Tracks < Muffon::Profile::Library::Album::Base
          include Muffon::Utils::Pagination

          private

          def album_data
            {
              title: title,
              artist: artist_data,
              page: page,
              total_pages: total_pages_count,
              tracks: tracks_formatted
            }
          end

          def total_items_count
            profile_album.profile_tracks_count
          end

          def tracks_formatted
            tracks_paginated.map do |t|
              track_data_formatted(t)
            end
          end

          def tracks_paginated
            tracks_sorted
              .limit(limit)
              .offset(offset)
          end

          def tracks_sorted
            tracks_associated.order(
              created_at: :asc
            )
          end

          def tracks_associated
            profile_album
              .profile_tracks
              .includes(:track)
          end

          def track_data_formatted(track)
            Muffon::Profile::Library::Album::Tracks::Track.call(
              track: track
            )
          end
        end
      end
    end
  end
end
