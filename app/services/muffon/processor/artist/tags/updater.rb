module Muffon
  module Processor
    module Artist
      module Tags
        class Updater < Muffon::Processor::Artist::Base
          include Muffon::Utils::Artist

          private

          def no_data?
            tags.blank?
          end

          def tags
            @tags ||=
              LastFM::Artist::Tags.call(
                artist_name:
              ).dig(
                :artist,
                :tags
              )
          end

          def artist_name
            find_artist.name
          end

          def data
            find_artist.update!(
              tag_ids: tags_ids
            )
          end

          def tags_ids
            [
              *existing_tags_ids,
              *new_tags_ids
            ]
              .sort
          end

          def existing_tags_ids
            Tag
              .where(
                name_downcase:
                  tags_names_downcase
              )
              .pluck(:id)
          end

          def tags_names_downcase
            tags_names.map(&:downcase)
          end

          def tags_names
            @tags_names ||=
              tags.map do |tag|
                tag[:name].strip
              end
          end

          def new_tags_ids
            Tag
              .insert_all(
                new_tags_formatted
              )
              .pluck('id')
          end

          def new_tags_formatted
            tags_names.map do |tag_name|
              tag_data_formatted(
                tag_name
              )
            end
          end

          def tag_data_formatted(
            tag_name
          )
            {
              name: tag_name,
              name_downcase: tag_name.downcase
            }
          end
        end
      end
    end
  end
end
