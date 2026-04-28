module Muffon
  module Processor
    module Profile
      class Updater < Muffon::Processor::Profile::Base
        private

        def data
          profile_record.update(
            @args.slice(
              *profile_params
            )
          )

          if profile_record.errors?
            profile_record.errors_data
          else
            profile_record.process_image(
              @args[:image]
            )

            profile_info_data
          end
        end

        def profile_info_data
          Muffon::Profile::Info.call(
            **self_args
          )
        end
      end
    end
  end
end
