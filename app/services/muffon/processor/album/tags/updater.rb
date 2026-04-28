module Muffon
  module Processor
    module Album
      module Tags
        class Updater < Muffon::Processor::Album::Base
          include Muffon::Mixins::Album

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
            album_record.set_tags!(
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
