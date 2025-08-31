module Muffon
  module Profile
    module Favorites
      class Artists
        class Artist < Muffon::Profile::Favorites::Artists
          include Muffon::Utils::Artist
          include Muffon::Utils::Source::Artist

          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              favorite_artist
            ]
          end

          def data
            self_data
              .merge(favorite_artist_data)
          end

          def name
            artist.name
          end

          def artist
            @artist ||=
              favorite_artist.artist
          end

          def favorite_artist
            @args[:favorite_artist]
          end

          def favorite_artist_data
            {
              source: source_data,
              id: favorite_artist.id,
              name:,
              image: image_data,
              created: created_formatted
            }.compact
          end

          def image_data
            artist.image_data
          end

          def created_formatted
            datetime_formatted(
              favorite_artist.created_at
            )
          end
        end
      end
    end
  end
end
