module Muffon
  module Processor
    module Artist
      module Tags
        class Updater < Muffon::Processor::Artist::Base
          include Muffon::Utils::Artist

          private

          def data
            return if tags_list.blank?

            find_artist.update(
              tag_ids:
            )
          end

          def tags_list
            @tags_list ||=
              artist_tags_data.dig(
                :artist, :tags
              )
          end

          def artist_tags_data
            LastFM::Artist::Tags.call(
              artist: find_artist.name
            )
          end

          def tag_ids
            (
              existing_tag_ids + new_tag_ids
            ).sort
          end

          def existing_tag_ids
            Tag.where(
              name_downcase:
                tag_names.map(&:downcase)
            ).pluck(:id)
          end

          def tag_names
            @tag_names ||=
              tags_list.map do |t|
                t[:name].strip
              end
          end

          def new_tag_ids
            Tag.insert_all(
              new_tags_formatted
            ).pluck('id')
          end

          def new_tags_formatted
            tag_names.map do |name|
              format_tag(name)
            end
          end

          def format_tag(name)
            {
              name:,
              name_downcase: name.downcase
            }
          end
        end
      end
    end
  end
end
