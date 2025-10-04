module Spotify
  module Utils
    module Audio
      class Link
        class Token < Spotify::Base
          BASE_LINK =
            'http://localhost:3745/access_token'.freeze

          def call
            data
          rescue Faraday::ConnectionFailed
            nil
          end

          private

          def data
            if test?
              test_token
            else
              response_data['token']
            end
          end

          # rubocop:disable Layout/LineLength
          def test_token
            'BQDWcGQwx7dZ_zGOoUo9hFfaLDKA4ifWng3WXMtjY3_E7prsRbUL_2aRp1RWZoM21OYh2vD_WTJQeYNbj2PvlvZDfxbsdpb6PBmFYn_2h4GNmz1Mu4FCooXAOLxQYbeo6EuSJIynbu311JYxCcsRTO-bDCt-9zE8MdzYj2yseaRxz-sOqKmvHzoBNK0mo94VZLWqJ38sCjCTIz7s1gQLl5JqieeT70C6kXcFUcJTZ8inPRnRweVSNjSd2X63MIDgKnZHXX4CsVfxQ5hyRWjwjOODlB1d8b3CXiQFzlowV2Zyj_fNY7ShL_9sXBT3gVP82mftu192VLjXeJ0pRWfLDAXwGW0UZMAuCrfxHUvdxpxN7F-uHw6kJ60z6_mrpSPDbw'
          end
          # rubocop:enable Layout/LineLength

          def link
            BASE_LINK
          end
        end
      end
    end
  end
end
