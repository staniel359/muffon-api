module Spotify
  module Utils
    module Audio
      class Link
        class Key < Spotify::Utils::Audio::Link
          private

          def primary_args
            [
              @args[:track_id],
              @args[:file_id]
            ]
          end

          def no_data?
            # seektables_data.blank?
            false
          end

          # def seektables_data
          #   @seektables_data ||=
          #     Spotify::Utils::Audio::Link::Seektables.call(
          #       file_id:
          #     )
          # end

          def data
            return test_key if test?

            if matched_version? || development?
              response
                .body
                .unpack1('H*')
            end
          rescue Faraday::BadRequestError, Faraday::ConnectionFailed
            nil
          end

          def test_key
            'e9730e75426d748290f56f1f94074efc'
          end

          def matched_version?
            client_version.present? && (
              client_version >=
                Gem::Version.new('2.2.0-beta.5')
            )
          end

          def link
            "http://localhost:3745/audiokey/#{track_id}*#{file_id}"
          end

          def track_id
            @args[:track_id]
          end

          def file_id
            @args[:file_id]
          end

          # def pssh
          #   seektables_data['pssh']
          # end
        end
      end
    end
  end
end
