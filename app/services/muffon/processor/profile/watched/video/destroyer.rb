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

            def not_found?
              super || watched_video_record.blank?
            end

            def watched_video_record
              if defined?(@watched_video_record)
                @watched_video_record
              else
                @watched_video_record =
                  profile_record
                  .watched_videos
                  .find_by(
                    id: @args[:watched_id]
                  )
              end
            end

            def data
              watched_video_record.destroy!

              { success: true }
            end
          end
        end
      end
    end
  end
end
