module Spotify
  module Utils
    module Audio
      class Link
        class Track < Spotify::Utils::Audio::Link
          EXTENSION_KIND = 10

          def call
            check_args

            check_if_not_found

            data
          rescue Faraday::UnauthorizedError
            raise Muffon::Error::ForbiddenError
          end

          private

          def required_args
            %i[
              track_id
            ]
          end

          def not_found?
            track_data_encoded.blank?
          end

          def track_data_encoded
            @track_data_encoded ||=
              response_data.dig(
                :extended_metadata,
                :extension_data,
                :extension_data,
                :value
              )
          end

          def response_data
            SpotifyProtobuf::BatchedExtensionResponse
              .decode(response.body)
              .to_h
          end

          def link
            "#{BASE_LINK}/extended-metadata/v0/extended-metadata"
          end

          def payload
            SpotifyProtobuf::BatchedEntityRequest.encode(
              protobuf_request_message
            )
          end

          def protobuf_request_message
            SpotifyProtobuf::BatchedEntityRequest.new(
              protobuf_request_message_data
            )
          end

          def protobuf_request_message_data
            {
              entity_request: {
                entity_uri: track_id_formatted,
                query: {
                  extension_kind: EXTENSION_KIND
                }
              }
            }
          end

          def track_id_formatted
            "spotify:track:#{@args[:track_id]}"
          end

          def headers
            {
              **super,
              'Content-Type' => 'application/x-protobuf'
            }
          end

          def data
            SpotifyProtobuf::Track
              .decode(track_data_encoded)
              .to_h
              .deep_stringify_keys
          end

          alias response post_response
        end
      end
    end
  end
end
