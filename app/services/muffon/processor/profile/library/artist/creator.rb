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

            def process_profile_artist
              profile_artist

              return profile_artist.errors_data if
                  profile_artist.errors?

              { library_artist: library_artist_data }
            end

            def profile_artist
              @profile_artist ||=
                profile.profile_artists.where(
                  artist_id: find_artist.id
                ).first_or_create
            end

            def name
              @args[:name]
            end

            def library_artist_data
              { id: profile_artist.id }
            end
          end
        end
      end
    end
  end
end
