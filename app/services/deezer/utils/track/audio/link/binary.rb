module Deezer
  module Utils
    module Track
      module Audio
        class Link
          class Binary < Deezer::Base
            CHUNK_SIZE = 2048

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
              raw_audio_link.blank? || response_body.blank?
            end

            def raw_audio_link
              @raw_audio_link ||=
                Deezer::Utils::Track::Audio::Link::RawLink.call(
                  track_id: @args[:track_id]
                )
            end

            def response_body
              @response_body ||=
                Muffon::Request.call(
                  url: raw_audio_link,
                  method: 'GET',
                  response_type: 'raw',
                  cookies: request_cookies,
                  proxy: request_proxy
                ).body
            end

            def data
              chunks_count
                .times
                .each_with_object('') do |index, memo|
                  memo << process_chunk(index:)
                end
            end

            def chunks_count
              response_body
                .size
                .fdiv(
                  CHUNK_SIZE
                ).ceil
            end

            def process_chunk(index:)
              Deezer::Utils::Track::Audio::Link::Binary::Chunk.call(
                binary: response_body,
                index:,
                key:
              )
            end

            def key
              @key ||=
                Deezer::Utils::Track::Audio::Link::Key.call(
                  track_id: @args[:track_id]
                )
            end
          end
        end
      end
    end
  end
end
