module AmazonMusic
  module Utils
    module Audio
      class Link < AmazonMusic::Base
        FILE_EXTENSION = 'mp4'.freeze

        include Muffon::Utils::Audio::Link

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
          track_data.blank? ||
            file_data.blank? ||
            key.blank?
        end

        def track_data
          @track_data ||=
            AmazonMusic::Utils::Audio::Link::Track.call(
              track_id:
            )
        end

        def track_id
          @args[:track_id]
        end

        def file_data
          @file_data ||=
            track_data['Representation'].find do |d|
              d['qualityRanking'] == '1000'
            end
        end

        def key
          @key ||=
            AmazonMusic::Utils::Audio::Link::Key.call(
              track_data:
            )
        end

        def write_audio_data_to_file
          return if test?

          `ffmpeg \
            -decryption_key #{key} \
            -i "#{file_link}" \
            -y \
            -movflags +faststart \
            -c copy \
            -loglevel error \
            public/#{audio_path}`
        end

        def file_link
          file_data['BaseURL']
        end
      end
    end
  end
end
