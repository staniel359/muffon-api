module SoundCloud
  module Utils
    module Track
      module Audio
        class Link < SoundCloud::Base
          def call
            check_args

            return if no_data?

            data
          end

          private

          def required_args
            %i[
              raw_track_data
            ]
          end

          def no_data?
            audio_link_data.blank?
          end

          def audio_link_data
            audio_links.find do |data|
              mp3_link?(data)
            end
          end

          def audio_links
            @args[:raw_track_data].dig(
              'media',
              'transcodings'
            )
          end

          def mp3_link?(data)
            data['preset'].start_with?('mp3') &&
              data.dig('format', 'protocol') == 'progressive'
          end

          def data
            response_data['url']
          end

          def request_url
            audio_link_data['url']
          end
        end
      end
    end
  end
end
