module Muffon
  module Processor
    module Profile
      module Favorites
        module Artist
          class Creator < Muffon::Processor::Profile::Favorites::Base
            include Muffon::Utils::Artist

            private

            def primary_args
              super + [
                @args[:name]
              ]
            end

            def process_favorite
              favorite_artist

              return favorite_artist.errors_data if
                  favorite_artist.errors?

              { favorite_artist: favorite_artist_data }
            end

            def favorite_artist
              @favorite_artist ||=
                profile.favorite_artists.where(
                  artist_id: find_artist.id
                ).first_or_create
            end

            def name
              @args[:name]
            end

            def favorite_artist_data
              { id: favorite_artist.id }
            end
          end
        end
      end
    end
  end
end
