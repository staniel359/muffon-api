module Muffon
  module Formatter
    module Source
      module Artist
        class Info < Muffon::Formatter::Source::Artist::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              source_original_link
              source_name
              source_artist_id
              name
              image_data
              description
              description_size
              tags
              tags_size
              recommendation_data
              plays_count
            ]
          end

          def data
            {
              **self_data,
              source: source_data,
              name:,
              image: image_data,
              description: description_computed,
              tags: tags_computed,
              recommendation: recommendation_data,
              listeners_count:,
              plays_count:,
              profiles_count:,
              **with_more_data
            }.compact
          end
        end
      end
    end
  end
end
