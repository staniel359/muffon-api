module Muffon
  module Profile
    class Recommendations
      module Filter
        class Artists < Muffon::Profile::Recommendations
          def call
            data
          end

          private

          def data
            recommendations.where(
              'library_artist_ids @> ARRAY[?]',
              library_artist_ids
            )
          end

          def library_artist_ids
            profile
              .library_artists
              .where(artist_id: artist_ids)
              .pluck(:id)
          end

          def artist_ids
            @args[:filter_value].map do |name|
              artist_id(name)
            end.compact
          end

          def artist_id(name)
            Artist.with_name(
              name
            )&.id
          end
        end
      end
    end
  end
end
