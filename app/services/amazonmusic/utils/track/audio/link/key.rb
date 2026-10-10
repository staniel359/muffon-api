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
                --device_id '#{device_id}' \
                --device_type_id '#{device_type_id}' \
                --user_agent '#{REQUEST_USER_AGENT}'`
            end

            def test_key
              'ff977dc8ff011ef4dbcc9d06d2ea7134'
            end

            def pssh
              pssh_data['pssh']
            end

            def pssh_data
              @args[:track_data]['ContentProtection'].find do |data|
                data['pssh'].present?
              end
            end

            def amazonmusic_token
              get_global_value(
                'amazonmusic:token',
                expires_in_seconds: 3600,
                refresh_class_name: 'AmazonMusic::Utils::Token'
              )
            end
          end
        end
      end
    end
  end
end
