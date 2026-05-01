module AmazonMusic
  module Utils
    module Track
      module Audio
        class Link
          class Track < AmazonMusic::Base
            REQUEST_BASE_URL =
              'https://music.amazon.co.uk/EU/api/dmls/'.freeze

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
              manifest_xml.blank?
            end

            def manifest_xml
              @manifest_xml ||=
                response_data.dig(
                  'contentResponseList',
                  0,
                  'manifest'
                )
            end

            def response_data
              Muffon::Request.call(
                url: REQUEST_BASE_URL,
                method: 'POST',
                payload: request_payload,
                headers: request_headers,
                cookies: request_cookies
              )
            end

            def request_payload
              {
                'deviceToken' => {
                  'deviceId' => DEVICE_ID,
                  'deviceTypeId' => DEVICE_TYPE_ID
                },
                'customerId' => 'A2ZUU2NB43P99O',
                'contentIdList' => [
                  {
                    'identifier' => @args[:track_id],
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

            def request_headers
              {
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

            def request_cookies
              return test_amazon_music_cookies if test?

              {
                'ubid-acbuk' => first_cookie,
                'at-acbuk' => second_cookie
              }
            end

            def first_cookie
              BROWSER_COOKIES_DATABASE
                .execute(
                  <<~SQL.squish
                    SELECT value
                    FROM moz_cookies
                    WHERE
                      host LIKE '%amazon%'
                      AND name = 'ubid-acbuk'
                  SQL
                )
                .flatten
                .first
            end

            def test_amazon_music_cookies
              credentials.dig(
                :amazon_music,
                :cookies
              )
            end

            def second_cookie
              BROWSER_COOKIES_DATABASE
                .execute(
                  <<~SQL.squish
                    SELECT value
                    FROM moz_cookies
                    WHERE
                      host LIKE '%amazon%'
                      AND name = 'at-acbuk'
                  SQL
                )
                .flatten
                .first
            end

            def data
              tracks.find do |track_data|
                track_data['selectionPriority'] == '500'
              end
            end

            def tracks
              manifest_data.dig(
                'MPD',
                'Period',
                'AdaptationSet'
              )
            end

            def manifest_data
              Hash.from_xml(
                manifest_xml
              )
            end
          end
        end
      end
    end
  end
end
