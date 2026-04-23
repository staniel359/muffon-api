module Muffon
  module Formatter
    module Search
      module AlbumGroups
        class AlbumGroup < Muffon::Formatter::AlbumGroup::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              source_original_link
              source_name
              source_album_group_id
              title
              artists
              image_data
              release_date
            ]
          end

          def data
            {
              **self_data,
              source: source_data,
              title:,
              artist: artist_data,
              artists:,
              image: image_data,
              release_date:,
              listeners_count:
            }.compact
          end
        end
      end
    end
  end
end
