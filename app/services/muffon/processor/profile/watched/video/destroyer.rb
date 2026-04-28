module Muffon
  module Processor
    module Profile
      module Watched
        module Video
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :watched_id
              ]
            end

            def data
              watched_video_record.destroy!

              { success: true }
            end

            def watched_video_record
              profile_record
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
