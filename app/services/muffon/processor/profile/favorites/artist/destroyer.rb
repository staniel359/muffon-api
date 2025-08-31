module Muffon
  module Processor
    module Profile
      module Favorites
        module Artist
          class Destroyer < Muffon::Processor::Profile::Favorites::Base
            private

            def required_args
              super + %i[
                favorite_id
              ]
            end

            def process_favorite
              favorite_artist&.destroy

              { success: true }
            end

            def favorite_artist
              if instance_variable_defined?(
                :@favorite_artist
              )
                @favorite_artist
              else
                @favorite_artist =
                  profile
                  .favorite_artists
                  .find_by(
                    id: @args[:favorite_id]
                  )
              end
            end
          end
        end
      end
    end
  end
end
