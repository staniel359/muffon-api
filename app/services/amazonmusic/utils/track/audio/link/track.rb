module AmazonMusic
  module Utils
    module Track
      module Audio
        class Link
          class Track < AmazonMusic::Base
            REQUEST_BASE_URL =
              'https://music.amazon.co.uk/ZAZ/api/dmls/'.freeze

            def call
              check_args

              return if no_data?

              data
            rescue Faraday::BadRequestError
              retry_with_new_cookies
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
                  'deviceId' => device_id,
                  'deviceTypeId' => device_type_id
                },
                'customerId' => customer_id,
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
                  'marketplaceId' => marketplace_id,
                  'territoryId' => 'GB'
                },
                'appInfo' => {
                  'musicAgent' =>
                    'Vinyl/2.0 GreenHornet_Web/1.0.1321 ' \
                    '(b65c-9945-Gree-3bcf-beb5a)'
                }
              }.to_json
            end

            def customer_id
              credentials.dig(
                :amazon_music,
                :customer_id
              )
            end

            def marketplace_id
              credentials.dig(
                :amazon_music,
                :marketplace_id
              )
            end

            def request_headers
              {
                'Content-Encoding' => 'amz-1.0',
                'X-Amz-Target' =>
                  'com.amazon.digitalmusiclocator.' \
                  'DigitalMusicLocatorServiceExternal.getDashManifestsV2',
                'csrf-token' => csrf_token,
                'csrf-rnd' => csrf_rnd,
                'csrf-ts' => csrf_ts
              }
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
