module Muffon
  module Worker
    module Artist
      module Tags
        class Updater < Muffon::Base
          private

          def data
            return if @args[:name].blank?

            ::Artist::Tags::UpdaterWorker.perform_async(
              worker_args
            )
          end

          def worker_args
            @args.slice(
              :name
            ).to_json
          end
        end
      end
    end
  end
end
