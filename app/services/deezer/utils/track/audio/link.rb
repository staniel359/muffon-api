module Deezer
  module Utils
    module Track
      module Audio
        class Link < Deezer::Base
          FILE_EXTENSION = 'mp3'.freeze

          include Muffon::Mixins::Processing::Audio

          def call
            check_args

            return if no_data?

            data
          end

          private

          def required_args
            %i[
              track_id
            ]
          end

          def no_data?
            audio_binary_data.blank?
          end

          def audio_binary_data
            @audio_binary_data ||=
              Deezer::Utils::Track::Audio::Link::Binary.call(
                track_id: @args[:track_id]
              )
          end

          def data
            create_audio_folder

            write_audio_data_to_file

            audio_link
          end

          def write_audio_data_to_file
            File.open(
              "public/#{audio_path}",
              'wb'
            ) do |file|
              file << audio_binary_data
            end
          end
        end
      end
    end
  end
end
