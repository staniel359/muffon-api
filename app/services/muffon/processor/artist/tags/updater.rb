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
              tag_ids: tag_ids
            )
          end

          def tags_list
            @tags_list ||=
              artist_data.dig(
                :artist, :tags
              )
          end

          def artist_data
            LastFM::Artist::Tags.call(
              artist: find_artist.name
            )
          end

          def tag_ids
            tags_list.map do |tag|
              tag_id(tag[:name])
            end
          end

          def tag_id(name)
            ::Tag.with_name(
              name
            ).id
          end
        end
      end
    end
  end
end
