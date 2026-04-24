module Muffon
  module Worker
    module Album
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
              album_title
            ]
          end

          def data
            ::Album::Tags::UpdaterWorker.perform_async(
              worker_args_formatted
            )
          end

          def worker_args
            {
              artist_name: @args[:artist_name],
              album_title: @args[:album_title]
            }
          end
        end
      end
    end
  end
end
