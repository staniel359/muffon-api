module Muffon
  module Profile
    module Playlist
      class Base < Muffon::Profile::Base
        private

        def primary_args
          [
            @args[:profile_id],
            @args[:token]
          ]
        end

        def no_data?
          super || playlist.blank?
        end

        def playlist
          @playlist ||= profile.playlists.find_by(
            id: @args[:playlist_id]
          )
        end

        def errors?
          playlist.errors.any?
        end

        def errors
          playlist.errors_formatted
        end

        def process_image
          playlist.process_image(
            @args[:image]
          )
        end

        def profile_data
          {
            nickname: nickname,
            playlist: playlist_data
          }
        end
      end
    end
  end
end
