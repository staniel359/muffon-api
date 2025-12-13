module SoundCloud
  module Utils
    module Audio
      class AlternativeLink < SoundCloud::API::V2::Base
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
            link
          ]
        end

        def no_data?
          track_data.blank? ||
            audio_link_data.blank?
        end

        def track_data
          @track_data ||=
            SoundCloud::Utils::Audio::AlternativeLink::TrackData.call(
              link: @args[:link]
            )
        end

        def audio_link_data
          @audio_link_data ||=
            audio_links.find do |data|
              mp3_link?(data)
            end
        end

        def audio_links
          track_data.dig(
            'data',
            'media',
            'transcodings'
          ) || []
        end

        def mp3_link?(data)
          preset = data['preset']

          protocol =
            data.dig(
              'format',
              'protocol'
            )

          preset.start_with?('mp3') &&
            protocol == 'progressive'
        end

        def audio_binary_data
          audio_file_response.body
        end

        def audio_file_response
          format_get_request(
            link: audio_file_link,
            params: audio_file_request_params,
            proxy:
          )
        end

        def audio_file_link
          audio_file_link_response_data['url']
        end

        def audio_file_link_response_data
          JSON.parse(
            audio_file_link_response.body
          )
        end

        def audio_file_link_response
          format_get_request(
            link: audio_file_link_request_link,
            params: audio_file_link_request_params,
            proxy:
          )
        end

        def audio_file_link_request_link
          audio_link_data['url']
        end

        def audio_file_link_request_params
          { client_id: }
        end

        def audio_file_request_params
          {
            track_authorization:
              track_authorization_token
          }
        end

        def track_authorization_token
          track_data.dig(
            'data',
            'track_authorization'
          )
        end
      end
    end
  end
end
