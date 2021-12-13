module Muffon
  module Profile
    class Playlists < Muffon::Profile::Base
      include Muffon::Utils::Pagination
      include Muffon::Utils::Track

      private

      def profile_data
        {
          nickname: nickname,
          page: page,
          total_pages: total_pages_count,
          playlists: playlists_formatted
        }
      end

      def total_items_count
        playlists.size
      end

      def playlists
        @playlists ||= profile.playlists
      end

      def playlists_formatted
        playlists_paginated.map do |t|
          playlist_formatted(t)
        end
      end

      def playlists_paginated
        playlists_sorted
          .limit(limit)
          .offset(offset)
      end

      def playlists_sorted
        playlists.order(
          created_at: :asc
        )
      end

      def playlist_formatted(playlist)
        Muffon::Profile::Playlists::Playlist.call(
          playlist: playlist,
          track_id: track_id
        )
      end

      def track_id
        find_track.id if find_track?
      end

      def find_track?
        [
          @args[:track_title],
          @args[:artist_name]
        ].all?(&:present?)
      end

      def title
        @args[:track_title]
      end

      def artist_name
        @args[:artist_name]
      end
    end
  end
end
