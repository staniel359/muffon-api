module Muffon
  module Processor
    module Profile
      module Listened
        module Album
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :listened_id
              ]
            end

            def not_found?
              super || listened_album_record.blank?
            end

            def listened_album_record
              if defined?(@listened_album_record)
                @listened_album_record
              else
                @listened_album_record =
                  profile_record
                  .listened_albums
                  .find_by(
                    id: @args[:listened_id]
                  )
              end
            end

            def data
              listened_album_record.destroy!

              { success: true }
            end
          end
        end
      end
    end
  end
end
