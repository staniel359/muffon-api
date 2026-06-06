module Deezer
  module Utils
    module Audio
      class Decrypter
        class Binary < Deezer::Utils::Audio::Decrypter
          CHUNK_SIZE = 2048

          def call
            check_args

            return if no_data?

            data
          rescue Faraday::ForbiddenError
            nil
          end

          private

          def required_args
            %i[
              link
              track_id
            ]
          end

          def no_data?
            response.blank?
          end

          def response
            @response ||=
              format_get_request(
                link:
              ).body
          end

          def link
            @args[:link]
          end

          def data
            chunks_count
              .times
              .each_with_object('') do |index, memo|
                memo << process_chunk(index)
              end
          end

          def chunks_count
            response
              .size
              .fdiv(
                CHUNK_SIZE
              ).ceil
          end

          def process_chunk(index)
            Deezer::Utils::Audio::Decrypter::Binary::Chunk.call(
              binary: response,
              index:,
              key:
            )
          end

          def key
            @key ||=
              Deezer::Utils::Audio::Decrypter::Key.call(
                track_id: @args[:track_id]
              )
          end
        end
      end
    end
  end
end
