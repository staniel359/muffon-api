module Muffon
  module Worker
    module Artist
      module Tags
        class Updater < Muffon::Worker::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              artist_name
            ]
          end

          def data
            ::Artist::Tags::UpdaterWorker.perform_async(
              worker_args_formatted
            )
          end

          def worker_args
            { artist_name: @args[:artist_name] }
          end
        end
      end
    end
  end
end
