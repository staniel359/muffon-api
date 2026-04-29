module Muffon
  module Formatter
    module Source
      module AlbumGroup
        class Info < Muffon::Formatter::Source::AlbumGroup::Base
          DESCRIPTION_SIZE = 'medium'.freeze

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
              description
              tags
              tags_size
              tracks
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
              description: description_computed,
              tags: tags_computed,
              listeners_count:,
              profiles_count:,
              tracks:,
              **with_more_data
            }.compact
          end
        end
      end
    end
  end
end
