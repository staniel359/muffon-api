module AmazonMusic
  module Utils
    module Audio
      class Track < AmazonMusic::Base
        BASE_LINK =
          'https://music.amazon.co.uk/EU/api/dmls/'.freeze

        def call
          return if not_all_args? || no_data?

          data
        rescue StandardError
          nil
        end

        private

        def primary_args
          [@args[:track_id]]
        end

        def no_data?
          manifest_xml.blank?
        end

        def manifest_xml
          @manifest_xml ||=
            response_data.dig(
              'contentResponseList', 0, 'manifest'
            )
        end

        def link
          BASE_LINK
        end

        def payload
          {
            'deviceToken' => {
              'deviceId' => DEVICE_ID,
              'deviceTypeId' => DEVICE_TYPE_ID
            },
            'customerId' => 'A2ZUU2NB43P99O',
            'contentIdList' => [
              {
                'identifier' => track_id,
                'identifierType' => 'ASIN'
              }
            ],
            'musicDashVersionList' => [
              'SIREN_KATANA_NO_CLEAR_LEAD'
            ],
            'contentProtectionList' => [
              'TRACK_PSSH'
            ],
            'customerInfo' => {
              'marketplaceId' => 'A1F83G8C2ARO7P',
              'territoryId' => 'GB'
            },
            'appInfo' => {
              'musicAgent' =>
                'Maestro/1.0 WebCP/1.0.15759.0 (2304-bacb-WebC-8fee-37964)'
            }
          }.to_json
        end

        def track_id
          @args[:track_id]
        end

        def headers
          {
            'User-Agent' => USER_AGENT,
            'Content-Encoding' => 'amz-1.0',
            'X-Amz-Target' =>
              'com.amazon.digitalmusiclocator' \
              '.DigitalMusicLocatorServiceExternal' \
              '.getDashManifestsV2',
            'csrf-rnd' => '1533618916',
            'csrf-token' =>
              'co4KZ+YisVWVE/UZXJkqXZ6CeIwO1F38N7Yvsnv1c2I=',
            'csrf-ts' => '1725608500761'
          }
        end

        # Need to be refreshed
        def cookies
          {
            'ubid-acbuk' =>
              cookies_secrets[:ubid_acbuk],
            'at-acbuk' =>
              cookies_secrets[:at_acbuk]
          }
        end

        def cookies_secrets
          secrets.amazon_music[:cookies]
        end

        def data
          tracks.find do |track_data|
            track_data['selectionPriority'] == '500'
          end
        end

        def tracks
          manifest_data.dig(
            'MPD', 'Period', 'AdaptationSet'
          )
        end

        def manifest_data
          Hash.from_xml(
            manifest_xml
          )
        end

        alias response post_response
      end
    end
  end
end
