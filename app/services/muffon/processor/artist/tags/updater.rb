module Muffon
  module Processor
    module Artist
      module Tags
        class Updater < Muffon::Processor::Artist::Base
          include Muffon::Mixins::Artist

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
            artist_record.set_tags!(
              tags_names:
            )
          end

          def tags_names
            tags.pluck(:name)
          end
        end
      end
    end
  end
end
