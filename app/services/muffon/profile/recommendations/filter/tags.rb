module Muffon
  module Profile
    class Recommendations
      module Filter
        class Tags < Muffon::Profile::Recommendations
          def call
            data
          end

          private

          def data
            recommendations
              .left_joins(:artist)
              .where(
                'artists.tag_ids @> ARRAY[?]',
                tag_ids
              )
          end

          def tag_ids
            @args[:filter_value].map do |name|
              tag_id(name)
            end.compact
          end

          def tag_id(name)
            Tag.with_name(
              name
            )&.id
          end
        end
      end
    end
  end
end
