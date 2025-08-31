module Muffon
  module Processor
    module Profile
      module Playlist
        class Updater < Muffon::Processor::Profile::Playlist::Base
          private

          def required_args
            super + %i[
              playlist_id
              title
            ]
          end

          def not_found?
            super ||
              playlist.blank?
          end

          def process_playlist
            playlist.update(
              update_args
            )

            if playlist.errors?
              playlist.errors_data
            else
              process_image

              { playlist: playlist_data }
            end
          end

          def update_args
            {
              title: @args[:title],
              description: @args[:description],
              private: @args[:private]
            }
          end

          def playlist_data
            Muffon::Profile::Playlist::Info.call(
              playlist_id: @args[:playlist_id],
              profile_id: @args[:profile_id],
              token: @args[:token]
            ).dig(
              :profile,
              :playlist
            )
          end
        end
      end
    end
  end
end
