module Muffon
  module Profile
    class Playlists
      class Playlist < Muffon::Profile::Base
        def call
          data
        end

        private

        def data
          playlist_base_data
            .merge(playlist_extra_data)
        end

        def playlist_base_data
          {
            id: playlist.id,
            playlist_track_id:
              playlist_track&.id,
            title: playlist.title,
            profile: profile_data,
            private: playlist.private
          }.compact
        end

        def playlist
          @args[:playlist]
        end

        def playlist_track
          return if @args[:track_id].blank?

          playlist.playlist_tracks.find_by(
            track_id: @args[:track_id]
          )
        end

        def profile_data
          {
            id: profile.id,
            nickname: profile.nickname
          }.compact
        end

        def profile
          @profile ||= playlist.profile
        end

        def playlist_extra_data
          {
            image: playlist.image_data,
            tracks_count:
              playlist.tracks_count,
            created: created_formatted
          }.compact
        end

        def created_formatted
          datetime_formatted(
            playlist.created_at
          )
        end
      end
    end
  end
end
