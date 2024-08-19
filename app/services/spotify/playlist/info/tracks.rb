module Spotify
  module Playlist
    class Info
      class Tracks < Spotify::Playlist::Info
        PAGE_LIMIT = 100

        include Muffon::Utils::Pagination

        private

        def primary_args
          super + [
            @args[:total_items_count]
          ]
        end

        def data
          {
            tracks:
              tracks_filtered_distinct
          }
        end

        def tracks_filtered_distinct
          tracks_filtered.uniq do |t|
            t.dig('track', 'id')
          end
        end

        def tracks_filtered
          tracks.select do |t|
            t.try(:[], 'track').present?
          end
        end

        def tracks
          total_pages_count
            .times
            .map do |page|
              page_tracks(page + 1)
            end.flatten
        end

        def pages_count
          total_items_count.fdiv(
            PAGE_LIMIT
          ).ceil
        end

        def total_items_count
          @args[:total_items_count]
        end

        def page_tracks(page)
          Spotify::Playlist::Info::Tracks::Page.call(
            page:,
            profile_id:
              @args[:profile_id],
            playlist_id:
              @args[:playlist_id],
            limit:
          )
        end
      end
    end
  end
end
