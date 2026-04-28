module Muffon
  module Processor
    module Profile
      module Playlist
        class Updater < Muffon::Processor::Profile::Playlist::Base
          private

          def required_args
            [
              *super,
              :playlist_id,
              :title
            ]
          end

          def data
            playlist_record.update(
              title: @args[:title],
              description: @args[:description],
              private: @args[:private]
            )

            if playlist_record.errors?
              playlist_record.errors_data
            else
              playlist_record.process_image(
                @args[:image]
              )

              { playlist: playlist_data }
            end
          end

          def playlist_data
            Muffon::Profile::Playlist::Info.call(
              playlist_id: playlist_record.id,
              **self_args
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
