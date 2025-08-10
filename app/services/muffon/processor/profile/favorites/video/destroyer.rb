module Muffon
  module Processor
    module Profile
      module Favorites
        module Video
          class Destroyer < Muffon::Processor::Profile::Favorites::Base
            private

            def primary_args
              super + [
                @args[:favorite_id]
              ]
            end

            def process_favorite
              favorite_video&.destroy

              { success: true }
            end

            def favorite_video
              if instance_variable_defined?(
                :@favorite_video
              )
                @favorite_video
              else
                @favorite_video =
                  profile
                  .favorite_videos
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
