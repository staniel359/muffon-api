module Muffon
  module Processor
    module Profile
      module Favorites
        module Artist
          class Creator < Muffon::Processor::Profile::Base
            include Muffon::Mixins::Artist

            private

            def required_args
              [
                *super,
                :artist_name
              ]
            end

            def data
              favorite_artist_record

              { favorite_artist: favorite_artist_data }
            end

            def favorite_artist_record
              @favorite_artist_record ||=
                profile_record
                .favorite_artists
                .where(
                  artist_id: artist_record.id
                )
                .first_or_create!
            end

            def name
              @args[:artist_name]
            end

            def favorite_artist_data
              { id: favorite_artist_record.id }
            end
          end
        end
      end
    end
  end
end
