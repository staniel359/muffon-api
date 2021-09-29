module Muffon
  module Profile
    class Playlists < Muffon::Profile::Base
      include Muffon::Utils::Pagination

      private

      def data
        { profile: profile_data }
      end

      def profile_data
        {
          nickname: nickname,
          page: page,
          total_pages: total_pages_count,
          playlists: playlists_formatted
        }
      end

      def nickname
        profile.nickname
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
          track_id: @args.track_id
        )
      end
    end
  end
end
