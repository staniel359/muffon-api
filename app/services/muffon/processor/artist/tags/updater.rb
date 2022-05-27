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
            existing_tag_ids + new_tag_ids
          end

          def existing_tag_ids
            existing_tags.map(&:id)
          end

          def existing_tags
            @existing_tags ||=
              Tag.where(
                'lower(name) = any(array[?])',
                tag_names.map(&:downcase)
              )
          end

          def tag_names
            @tag_names ||=
              tags_list.pluck(:name)
          end

          def new_tag_ids
            return [] if new_tags.blank?

            Tag.insert_all(
              new_tags_formatted
            ).pluck('id')
          end

          def new_tags
            @new_tags ||=
              tag_names.reject do |n|
                n.downcase.in?(
                  existing_tag_names
                )
              end
          end

          def existing_tag_names
            @existing_tag_names ||=
              existing_tags.map do |t|
                t[:name].downcase
              end
          end

          def new_tags_formatted
            new_tags.map do |name|
              { name: }
            end
          end
        end
      end
    end
  end
end
