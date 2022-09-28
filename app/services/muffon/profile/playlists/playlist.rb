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
            playlist_track_ids:,
            title: playlist.title,
            profile: profile_data,
            private: playlist.private
          }.compact
        end

        def playlist
          @args[:playlist]
        end

        def playlist_track_ids
          return if playlist_tracks.blank?

          playlist_tracks
            .pluck(:id)
            .presence
        end

        def playlist_tracks
          @playlist_tracks ||=
            playlist_tracks_scoped
        end

        def playlist_tracks_scoped
          if @args[:track_id].present?
            track_playlist_tracks
          elsif @args[:album_id].present?
            album_playlist_tracks
          end
        end

        def track_playlist_tracks
          playlist
            .playlist_tracks
            .where(
              track_id: @args[:track_id]
            )
        end

        def album_playlist_tracks
          playlist
            .playlist_tracks
            .where(
              album_id: @args[:album_id]
            )
        end

        def profile_data
          {
            id: profile.id,
            nickname: profile.nickname,
            private: profile.private
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
