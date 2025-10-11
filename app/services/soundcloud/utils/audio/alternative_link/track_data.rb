module SoundCloud
  module Utils
    module Audio
      class AlternativeLink
        class TrackData < SoundCloud::Utils::Audio::AlternativeLink
          def call
            check_args

            return if no_data?

            data
          end

          private

          def required_args
            %i[
              link
            ]
          end

          def no_data?
            track_script.blank?
          end

          def track_script
            @track_script ||=
              scripts.find do |script|
                track_script?(script)
              end
          end

          def scripts
            response_data.css(
              'script'
            )
          end

          def response_data
            Nokogiri::HTML.parse(
              response.body
            )
          end

          def response
            format_get_request(
              link: @args[:link]
            )
          end

          def track_script?(script)
            script
              .text
              .include?(
                'transcodings'
              )
          end

          def data
            track_data.find do |data|
              audio_data?(data)
            end
          end

          def track_data
            JSON.parse(
              raw_track_data
            )
          end

          def raw_track_data
            track_script
              .text
              .match(
                /window.__sc_hydration = (.+);/
              )[1]
          end

          def audio_data?(data)
            data['hydratable'] == 'sound'
          end
        end
      end
    end
  end
end
