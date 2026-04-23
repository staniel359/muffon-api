module Muffon
  module Formatter
    module User
      module Playlists
        class Playlist < Muffon::Formatter::User::Playlist::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              source_original_link
              source_name
              source_playlist_id
              title
              image_data
              description
              description_size
              tracks_count
              tracks
            ]
          end

          def data
            {
              source: source_data,
              title:,
              image: image_data,
              description:,
              tracks_count:,
              tracks:
            }.compact
          end
        end
      end
    end
  end
end
