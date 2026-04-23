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
            @tags ||= begin
              artist_tags_data.dig(
                :artist,
                :tags
              )
            rescue Muffon::Error::NotFoundError
              []
            end
          end

          def artist_tags_data
            LastFM::Artist::Tags.call(
              artist_name: @args[:artist_name]
            )
          end

          def data
            find_artist.update!(
              tags_ids: tags_ids.sort
            )
          end

          def tags_ids
            tags.map do |tag_data|
              tag_name = tag_data[:name]

              Tag.with_name(tag_name).id
            end
          end
        end
      end
    end
  end
end
