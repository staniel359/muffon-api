module SoundCloud
  module Utils
    module Audio
      class AlternativeLink < SoundCloud::API::V2::Base
        include Muffon::Utils::Audio::Link

        def call
          return if not_all_args? || no_data?

          data
        end

        private

        def primary_args
          [
            @args[:track_id],
            @args[:link]
          ]
        end

        def no_data?
          audio_data.blank? ||
            audio_link_data.blank?
        end

        def audio_data
          @audio_data ||=
            SoundCloud::Utils::Audio::AlternativeLink::AudioData.call(
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
          audio_data.dig(
            'data', 'media',
            'transcodings'
          )
        end

        def mp3_link?(data)
          data['preset'] == 'mp3_1_0'
        end

        def write_audio_data_to_file
          temp_file.write(
            m3u8_file_response.body
          )

          convert_m3u8_to_mp3

          temp_file.delete
        end

        def temp_file
          @temp_file ||= Tempfile.new
        end

        def m3u8_file_response
          format_get_request(
            link: m3u8_link_formatted
          )
        end

        def m3u8_link_formatted
          "#{m3u8_link}&track_authorization=#{track_authorization_token}"
        end

        def m3u8_link
          m3u8_response_data['url']
        end

        def m3u8_response_data
          JSON.parse(
            m3u8_response.body
          )
        end

        def m3u8_response
          format_get_request(
            link:
              m3u8_link_request_link,
            params:
              m3u8_link_request_params
          )
        end

        def m3u8_link_request_link
          audio_link_data['url']
        end

        def m3u8_link_request_params
          { client_id: }
        end

        def track_authorization_token
          audio_data.dig(
            'data', 'track_authorization'
          )
        end

        def convert_m3u8_to_mp3
          `ffmpeg -protocol_whitelist \
            file,http,https,tcp,tls,crypto \
            -y -i #{temp_file.path} \
            -c copy #{file_path}`
        end

        def file_path
          "public/#{audio_path}"
        end
      end
    end
  end
end
