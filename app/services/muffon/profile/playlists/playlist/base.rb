module Muffon
  module Profile
    class Playlists
      class Playlist
        class Base < Muffon::Profile::Base
          private

          def primary_args
            [
              @args[:profile_id],
              @args[:playlist_id]
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
            playlist.errors.map do |e|
              { e.attribute => e.type }
            end
          end

          def remove_image
            playlist.image.purge
          end

          def add_image
            playlist.image.attach(
              **image_file_data
            )
          end

          def profile_data
            {
              nickname: nickname,
              playlist: playlist_data
            }
          end

          def nickname
            profile.nickname
          end
        end
      end
    end
  end
end
