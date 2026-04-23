module Muffon
  module Processor
    module Track
      module Tags
        class Updater < Muffon::Processor::Track::Base
          include Muffon::Mixins::Track

          private

          def no_data?
            tags.blank?
          end

          def tags
            @tags ||= begin
              track_tags_data.dig(
                :track,
                :tags
              )
            rescue Muffon::Error::NotFoundError
              []
            end
          end

          def track_tags_data
            LastFM::Track::Tags.call(
              artist_name: @args[:artist_name],
              track_title: @args[:track_title]
            )
          end

          def data
            track_record.update!(
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
