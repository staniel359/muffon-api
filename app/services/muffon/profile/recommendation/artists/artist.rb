module Muffon
  module Profile
    module Recommendation
      class Artists
        class Artist < Muffon::Profile::Recommendation::Artists
          include Muffon::Utils::Library::Artist

          def call
            data
          end

          private

          def data
            self_data
              .merge(artist_data)
          end

          def artist_data
            {
              library: library_artist_data,
              name:,
              image: artist.image_data,
              albums_count:,
              tracks_count:,
              created: created_formatted
            }.compact
          end

          def library_artist
            @args[:library_artist]
          end
        end
      end
    end
  end
end
