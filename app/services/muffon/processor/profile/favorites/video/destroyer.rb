module Muffon
  module Processor
    module Profile
      module Favorites
        module Video
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :favorite_id
              ]
            end

            def not_found?
              super || favorite_video_record.blank?
            end

            def favorite_video_record
              if defined?(@favorite_video_record)
                @favorite_video_record
              else
                @favorite_video_record =
                  profile_record
                  .favorite_videos
                  .find_by(
                    id: @args[:favorite_id]
                  )
              end
            end

            def data
              favorite_video_record.destroy!

              { success: true }
            end
          end
        end
      end
    end
  end
end
