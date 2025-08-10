module Muffon
  module Processor
    module Profile
      module Watched
        module Video
          class Destroyer < Muffon::Processor::Profile::Watched::Base
            private

            def primary_args
              super + [
                @args[:watched_id]
              ]
            end

            def process_watched
              watched_video&.destroy

              { success: true }
            end

            def watched_video
              if instance_variable_defined?(
                :@watched_video
              )
                @watched_video
              else
                @watched_video =
                  profile
                  .watched_videos
                  .find_by(
                    id: @args[:watched_id]
                  )
              end
            end
          end
        end
      end
    end
  end
end
