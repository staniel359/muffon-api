module Muffon
  module Processor
    module Profile
      module Listened
        module Artist
          class Creator < Muffon::Processor::Profile::Listened::Base
            include Muffon::Utils::Artist

            private

            def required_args
              super + %i[
                artist_name
              ]
            end

            def process_listened
              listened_artist

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
                )
                .first_or_create!
            end

            def name
              @args[:artist_name]
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
