module AmazonMusic
  module Utils
    module Track
      module Audio
        class Link
          class Key < AmazonMusic::Base
            def call
              check_args

              data
            end

            private

            def required_args
              %i[
                track_data
              ]
            end

            def data
              return test_key if test?

              `python3.12 \
                lib/amazonmusic/key_retriever.py \
                --pssh '#{pssh}' \
                --token '#{amazonmusic_token}' \
                --device_id '#{DEVICE_ID}' \
                --device_type_id '#{DEVICE_TYPE_ID}' \
                --user_agent '#{REQUEST_USER_AGENT}'`
            end

            def test_key
              'eb4b5acce38bf49067154a452c93804f'
            end

            def pssh
              pssh_data['pssh']
            end

            def pssh_data
              @args[:track_data]['ContentProtection'].find do |data|
                data['pssh'].present?
              end
            end
          end
        end
      end
    end
  end
end
