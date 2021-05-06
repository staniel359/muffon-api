module Helpers
  module Deezer
    module Utils
      module Audio
        class << self
          def link_data
            'https://cdnt-proxy-7.dzcdn.net/media/1/e080754d49388cc67f8193e45ab8575aa378aedacdee7a9cd839749a6fbfd1fae62c6aa61e65f9610b970859c54340b971c44e31bc2120aa3894f04b279072ed538272a1b9564d14201c748fd62bde46?hdnea=exp=1611464532~acl=/media/1/e080754d49388cc67f8193e45ab8575aa378aedacdee7a9cd839749a6fbfd1fae62c6aa61e65f9610b970859c54340b971c44e31bc2120aa3894f04b279072ed538272a1b9564d14201c748fd62bde46*~data=user_id=0~hmac=f932c81b9151af2cdc3dedaf5051e02ad1ea128b7e30b78e867dbd1bf6306891'
          end

          def decoder_data
            'public/temp/audio/deezer/11221319.mp3'
          end
        end
      end
    end
  end
end
