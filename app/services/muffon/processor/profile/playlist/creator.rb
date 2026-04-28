module Muffon
  module Processor
    module Profile
      module Playlist
        class Creator < Muffon::Processor::Profile::Playlist::Base
          private

          def required_args
            [
              *super,
              :title
            ]
          end

          def data
            playlist_record

            if playlist_record.errors?
              playlist_record.errors_data
            else
              playlist_record.process_image(
                @args[:image]
              )

              { playlist: playlist_data }
            end
          end

          def playlist_record
            @playlist_record ||=
              profile_record
              .playlists
              .create(
                title: @args[:title],
                description: @args[:description],
                private: @args[:private]
              )
          end

          def playlist_data
            { id: playlist_record.id }
          end
        end
      end
    end
  end
end
