module AmazonMusic
  module Utils
    module Audio
      class Key < AmazonMusic::Base
        private

        def primary_args
          [@args[:track_data]]
        end

        def data
          return test_key if test?

          `python3.12 \
            lib/amazonmusic/key_retriever.py \
            --pssh #{pssh} \
            --token "#{amazonmusic_token}" \
            --device_id "#{DEVICE_ID}" \
            --device_type_id "#{DEVICE_TYPE_ID}" \
            --user_agent "#{USER_AGENT}"`
        end

        def test_key
          'eb4b5acce38bf49067154a452c93804f'
        end

        def pssh
          pssh_data['pssh']
        end

        def pssh_data
          track_data['ContentProtection'].find do |data|
            data['pssh'].present?
          end
        end

        def track_data
          @args[:track_data]
        end
      end
    end
  end
end
