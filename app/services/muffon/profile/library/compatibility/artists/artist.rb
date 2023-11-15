module Muffon
  module Profile
    module Library
      module Compatibility
        class Artists
          class Artist < Muffon::Profile::Library::Compatibility::Artists
            include Muffon::Utils::Library::Artist
            include Muffon::Utils::Source::Artist

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
                source: source_data,
                library: library_artist_data,
                name:,
                image: image_data,
                albums_count:,
                tracks_count:,
                created: created_formatted
              }.compact
            end

            def library_artist
              @args[:library_artist]
            end

            def image_data
              artist.image_data
            end
          end
        end
      end
    end
  end
end
