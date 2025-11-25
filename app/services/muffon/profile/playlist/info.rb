module Muffon
  module Profile
    module Playlist
      class Info < Muffon::Profile::Playlist::Base
        private

        def playlist_data
          {
            id: playlist.id,
            title:,
            profile: playlist_profile_data,
            private: private?,
            image: image_data,
            description:,
            description_truncated:,
            tracks_count:,
            created: created_formatted,
            **with_more_data
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

        def image_data
          playlist.image_data
        end

        def description
          return if raw_description.blank?

          CGI.unescapeHTML(
            raw_description
          )
        end

        def raw_description
          playlist.description
        end

        def description_truncated
          text_truncated(
            description,
            size: 'medium'
          )
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
