module Muffon
  module Processor
    module Album
      module Tags
        class Updater < Muffon::Processor::Album::Base
          include Muffon::Utils::Album

          private

          def no_data?
            tags.blank?
          end

          def tags
            @tags ||= begin
              album_tags_data.dig(
                :album,
                :tags
              )
            rescue Muffon::Error::NotFoundError
              []
            end
          end

          def album_tags_data
            LastFM::Album::Tags.call(
              artist_name: @args[:artist_name],
              album_title: @args[:album_title]
            )
          end

          def data
            album_record.update!(
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
