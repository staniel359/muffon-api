module Muffon
  module Processor
    module Profile
      module Library
        module Artist
          class Creator < Muffon::Processor::Profile::Library::Artist::Base
            include Muffon::Utils::Artist

            private

            def primary_args
              super + [
                @args[:name]
              ]
            end

            def process_library_artist
              library_artist

              return library_artist.errors_data if
                  library_artist.errors?

              { library_artist: library_artist_data }
            end

            def library_artist
              @library_artist ||=
                profile.library_artists.where(
                  artist_id: find_artist.id
                ).first_or_create
            end

            def name
              @args[:name]
            end

            def library_artist_data
              { id: library_artist.id }
            end
          end
        end
      end
    end
  end
end
