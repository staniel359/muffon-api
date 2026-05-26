module Muffon
  module Processor
    module Profile
      module Favorites
        module Artist
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :favorite_id
              ]
            end

            def not_found?
              super || favorite_artist_record.blank?
            end

            def favorite_artist_record
              if defined?(@favorite_artist_record)
                @favorite_artist_record
              else
                @favorite_artist_record =
                  profile_record
                  .favorite_artists
                  .find_by(
                    id: @args[:favorite_id]
                  )
              end
            end

            def data
              favorite_artist_record.destroy!

              { success: true }
            end
          end
        end
      end
    end
  end
end
