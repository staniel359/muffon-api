module Muffon
  module Profile
    module Library
      class Artists
        class Artist < Muffon::Profile::Library::Artists
          include Muffon::Utils::Library::Artist
          include Muffon::Utils::Source::Artist

          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              library_artist
            ]
          end

          def data
            if @args[:minimal].present?
              artist_minimal_data
            else
              self_data
                .merge(artist_minimal_data)
                .merge(artist_base_data)
            end
          end

          def artist_minimal_data
            {
              source: source_data,
              library: library_artist_data,
              name:,
              image: image_data
            }
          end

          def library_artist
            @args[:library_artist]
          end

          def image_data
            artist.image_data
          end

          def artist_base_data
            {
              albums_count:,
              tracks_count:,
              created: created_formatted
            }.compact
          end
        end
      end
    end
  end
end
