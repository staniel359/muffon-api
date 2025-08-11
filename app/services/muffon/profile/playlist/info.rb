module Muffon
  module Profile
    module Playlist
      class Info < Muffon::Profile::Playlist::Base
        private

        def playlist_data
          playlist_base_data
            .merge(playlist_extra_data)
            .merge(with_more_data)
        end

        def playlist_base_data
          {
            id: playlist.id,
            title:,
            profile: playlist_profile_data,
            private: private?
          }.compact
        end

        def playlist
          if instance_variable_defined?(
            :@playlist
          )
            @playlist
          else
            @playlist =
              profile
              .playlists
              .associated
              .find_by(
                id: playlist_id
              )
          end
        end

        def title
          playlist.title
        end

        def playlist_profile_data
          {
            id: profile.id,
            nickname: profile.nickname,
            private: profile.private
          }.compact
        end

        def private?
          playlist.private
        end

        def playlist_extra_data
          {
            image: image_data,
            description:,
            description_truncated:,
            tracks_count:,
            created: created_formatted
          }.compact
        end

        def image_data
          playlist.image_data
        end

        def description
          playlist.description
        end

        def tracks_count
          playlist.tracks_count
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
