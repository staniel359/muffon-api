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
            title:,
            profile: profile_data,
            private: private?
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

        def title
          playlist.title
        end

        def profile_data
          {
            id: profile.id,
            nickname: profile.nickname,
            private: profile.private
          }.compact
        end

        def profile
          @profile ||=
            playlist.profile
        end

        def private?
          playlist.private
        end

        def playlist_extra_data
          {
            image: image_data,
            description:
              description_formatted,
            tracks_count:,
            created: created_formatted
          }.compact
        end

        def image_data
          playlist.image_data
        end

        def description_formatted
          return description if @args[:info]

          description_truncated_small
        end

        def tracks_count
          playlist.tracks_count
        end

        def description
          playlist.description
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
