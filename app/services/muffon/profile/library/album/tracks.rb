module Muffon
  module Profile
    module Library
      module Album
        class Tracks < Muffon::Profile::Library::Album::Base
          COLLECTION_NAME = 'tracks'.freeze
          include Muffon::Utils::Pagination

          private

          def album_data
            album_base_data
              .merge(paginated_data)
          end

          def album_base_data
            {
              title: title,
              artist: artist_data
            }
          end

          def total_items_count
            profile_album.profile_tracks_count
          end

          def collection
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
              created_at: :desc
            )
          end

          def tracks_associated
            profile_album
              .profile_tracks
              .includes(
                [track: :artist]
              )
          end

          def track_data_formatted(track)
            Muffon::Profile::Library::Album::Tracks::Track.call(
              track: track,
              profile_id: @args[:profile_id]
            )
          end
        end
      end
    end
  end
end
