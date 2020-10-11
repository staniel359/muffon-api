module Helpers
  module VK
    RANDOM_STRING = 'wejlhg239gh23'.freeze

    class << self
      def bad_request_error
        { error: { code: 400, text: 'Bad request' } }
      end

      def not_found_error
        { error: { code: 404, text: 'Not found' } }
      end

      def search_tracks_data
        {:search=>{:tracks=>[{:artist=>"Wild Nothing", :audio_id=>"371745467_456356977_70719a4efd7d42c2ea_de094a61618d04da1d", :length=>318, :title=>"Nocturne"}, {:artist=>"Wild Nothing", :audio_id=>"-2001472574_55472574_8771e50fdec1fce674_b67339d4ac9f715d03", :length=>329, :title=>"Nocturne"}, {:artist=>"11  Wild Nothing", :audio_id=>"-137926065_456239193_841c33e48138f4264f_d493e6449891745702", :length=>320, :title=>"Nocturne"}, {:artist=>"Wild Nothing", :audio_id=>"85112205_206375563_e32de27dc6d3dcbf44_098221d968ef144292", :length=>320, :title=>"Nocturne (zaycev.net)"}, {:artist=>"Wild Nothing", :audio_id=>"-44640094_456242121_32e05958a78cb3a691_f7368151882c2deb19", :length=>329, :title=>"Nocturne (Live from Brooklyn Steel)"}, {:artist=>"04 Wild Nothing", :audio_id=>"2000195956_324723570_2ea4b201b377ee398d_29e9d2a27f50fe3e42", :length=>320, :title=>"Nocturne [MirrorLess052 - Nocturne]"}, {:artist=>"Wild Nothing", :audio_id=>"346919962_456239019_b03abd5e4ed018f5ec_5b1ba81c139ea94567", :length=>320, :title=>"Nocturne"}, {:artist=>"Wild Nothing", :audio_id=>"86147289_354093074_50b34d7175cb466157_f0d03fa7979877d72a", :length=>316, :title=>"Nocturne"}, {:artist=>"Neptune Weather Forecast", :audio_id=>"1240248_287527697_39d76078454eaec034_11dfb87425cf47bff4", :length=>309, :title=>"Nocturne (Wild Nothing cover)"}, {:artist=>"Wild Nothing ", :audio_id=>"2000299822_401666077_679e2af5781a52679f_eb6958af261b1ea41d", :length=>2656, :title=>"Nocturne (Full Album)"}]}}
      end

      def search_albums_data
        {:search=>{:albums=>[{:artist=>"Wild Nothing", :title=>"Nocturne", :tracks=>[{:artist=>"Wild Nothing", :audio_id=>"-2001904796_58904796_9b5640bc807dc8d24c_c033a7b630f4c909f2", :length=>258, :title=>"Shadow"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904795_58904795_1cf3828f2b0252f12a_c45dd730bee36c74c2", :length=>185, :title=>"Midnight Song"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904794_58904794_221a4f8277447334b0_84182ebf9010fc9b0b", :length=>318, :title=>"Nocturne"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904793_58904793_9dced22d9838c0a0cf_0c664358bc9fb9f123", :length=>260, :title=>"Through the Grass"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904792_58904792_4095860243eddcf1dd_b28e0014f02c6339ec", :length=>193, :title=>"Only Heather"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904791_58904791_59988b86be1d27a7f0_0a8a2597418348d148", :length=>218, :title=>"This Chain Won&#39;t Break"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904790_58904790_c5a8a0f430007fb6fd_ab8cda83f7c5fb8e6a", :length=>209, :title=>"Disappear Always"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904789_58904789_471ec91dc3d290344b_be390b6f1dab977d68", :length=>330, :title=>"Paradise"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904788_58904788_69d3626e6840cd7f4f_217ce42a152e752193", :length=>231, :title=>"Counting Days"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904787_58904787_ebf32931d1bc82584f_3fb2d1b17a6712f04a", :length=>207, :title=>"The Blue Dress"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904786_58904786_c58e57d894017d5996_09b37fd0ec9c0dda2e", :length=>235, :title=>"Rheya"}]}]}}
      end

      def audio_data
        {:tracks=>[{:artist=>"Wild Nothing", :link=>"https://cs4-1v4.vkuseraudio.net/p3/ce3c91cdb25451.mp3?extra=r3mrpnpVZTwFSOKDOYAYuNcrz8668wS1ggfyzP_X2Uu8TI_ApZpyaY8rBNoG3W9ybqLcYm72M7qyt2cWqhsf_bjBiMzdQaeY-W1Tntb9tyDzQ0sqWts9S-jdNrK0vHKPMXdDdniQhMJaGfqsYrahzYXulyg&long_chunk=1", :title=>"Nocturne"}]}
      end

      def encoded_audio_link
        'https://vk.com/mp3/audio_api_unavailable.mp3?extra=A1HRmZiWzZz0sO5SocO1ofuVn3nAB2mOnhvFjKvHsdvOv2rcDJDYt1vFDhKODNDInLbUB3vMzvzMos9eALrSBs1olMrTBuvxCKqOoxHJlJDorc8OA2jpquXrC2ffzf91ru9cB3u1ltHmzxe6mhrMzxLSBKHKsJeXy2fUz25rBxa2EvHLrZj4Ad1HtNPKAhuWyO9LC2uVDxrWvYO5EhHZuNy2x3LFoxeVDfDPstqXDODLBMnumwnYttjLDMzVB3bZENaOoeDlCwe5zxP6qwLJl24Xm2KUzK49rguXEg90ALrSuODovNrIA25Up2S1C3jPmuu5ELPRlq#AqSYnta'
      end

      def decoded_audio_link
        'https://cs4-8v4.vkuseraudio.net/p4/ffe959a6cf6dc1.mp3?extra=PfON7zkK6Q4pEeirmBVpscu9OzHI9JmbjBjXkykqoxUaRnd2n_hoy_rtkusQ0W29Kbisb7_8tLvDNcn40nZqDG1T5dZo-z_mgHxq5zE-zOWl-EeyAwGO1oXy3Gx8WNTU1GNw5VELh4DAvEN0T-lN1DSWleM&long_chunk=1'
      end

      def track_data
        {:track=>[{:artist=>"Wild Nothing", :link=>"https://cs4-5v4.vkuseraudio.net/p3/b33f6e557c6f6a.mp3?extra=tCZFoNkZCubYb_IkGBwMPMjbQcx9GanNDhI-Y-9cnRvuh9J05NHrCb2GzvaRYortDQe2MQBm7qziTP_Jc5_krI5RKa-GYLpZDhudgB86ifIeZsAd_vLk0n2_Fns14UVDt6cUn67h5hQ7cRslg2no_HsjUg&long_chunk=1", :title=>"Nocturne"}]}
      end

      def remixsid
        '0fe974621aecc79edb01ae3900fbc0ec654a74e38e6d8e752220acfebbf75'
      end
    end
  end
end
