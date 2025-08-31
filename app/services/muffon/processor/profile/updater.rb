module Muffon
  module Processor
    module Profile
      class Updater < Muffon::Processor::Profile::Base
        private

        def data
          profile.update(
            update_params
          )

          if profile.errors?
            profile.errors_data
          else
            process_image

            profile_info_data
          end
        end

        def update_params
          @args.slice(
            *profile_params
          )
        end

        def profile_info_data
          Muffon::Profile::Info.call(
            profile_id: @args[:profile_id],
            token: @args[:token]
          )
        end
      end
    end
  end
end
