module Helpers
  module Deezer
    module Utils
      class << self
        def track_token_data
          {:track_token=>'AAAAAWWJwNxlitocTAtKWSy0LJEg5XnprjsblgdcvL_c5KwkD6qHqjFWoDuhM4XoJgKx27YMMRhI3CalK6-qiO9AlRXBR0mQYl0XM_bWiVw-7m0vRFRb9kFi9TYLdwjwtjpQv4epG7mWV4_-8UCv1y9ZSdM'}
        end

        def track_token_no_data
          {:track_token=>nil}
        end

        def audio_link
          'http://localhost:4001/media/audio/deezer/69000435.mp3'
        end

        def audio_decrypter_link
          'https://cdnt-proxy-b.dzcdn.net/media/1/9b5e235b8a06645110271c3ce5d72ed9c16fb7280c2a178b987a51dc5b31a40c016b5b2b4f02eb2444b97aceaf306fc89241c2c52bf27eee00b934a6ac34fd8927968be5aead5537b62a1ffb25ef1055?hdnea=exp=1704007689~acl=/media/1/9b5e235b8a06645110271c3ce5d72ed9c16fb7280c2a178b987a51dc5b31a40c016b5b2b4f02eb2444b97aceaf306fc89241c2c52bf27eee00b934a6ac34fd8927968be5aead5537b62a1ffb25ef1055*~data=user_id=0~hmac=4bfdaad3b60e95e4e34c8c18d22995029226c31dd7949f02d417a18adf16aa0e'
        end

        def audio_decrypter_key
          'c3fbb?ub5wt0jbaf'
        end

        def user_token_data
          {:api_token=>"Nz2WE60RssESnnhDjfi9WC2ju1um4-fb", :license_token=>"AAAAAmWQJWdlo-vntLRbpG05XMU5Z16sHFdXi6s1zQoAsh1fEwdITsSPEsYdWTCOIvdjfkgFqnh3QM0PkesA_rTfJbSnG4Dii7SQgwxyQDsY2ABc"}
        end
      end
    end
  end
end
