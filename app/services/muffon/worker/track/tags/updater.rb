module Muffon
  module Worker
    module Track
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
              track_title
            ]
          end

          def data
            ::Track::Tags::UpdaterWorker.perform_async(
              worker_args_formatted
            )
          end

          def worker_args
            {
              artist_name: @args[:artist_name],
              track_title: @args[:track_title]
            }
          end
        end
      end
    end
  end
end
