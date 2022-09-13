module Muffon
  module Processor
    module Profile
      module Listened
        module Artist
          class Creator < Muffon::Processor::Profile::Listened::Base
            include Muffon::Utils::Artist

            private

            def primary_args
              super + [
                @args[:name]
              ]
            end

            def process_listened
              listened_artist

              return listened_artist.errors_data if
                  listened_artist.errors?

              {
                listened_artist:
                  listened_artist_data
              }
            end

            def listened_artist
              @listened_artist ||=
                profile
                .listened_artists
                .where(
                  artist_id: find_artist.id
                ).first_or_create
            end

            def name
              @args[:name]
            end

            def listened_artist_data
              { id: listened_artist.id }
            end
          end
        end
      end
    end
  end
end
