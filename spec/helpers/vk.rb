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
        {:search=>{:tracks=>[{:artist=>"Wild Nothing", :audio_id=>"371745467_456356977_d87c35f8a1d0eaa2e1_98b64d652ac2cc458f", :length=>318, :title=>"Nocturne"}, {:artist=>"Wild Nothing", :audio_id=>"-2001472574_55472574_cc163cc99cdf603e2a_636de2d346ff5ba7da", :length=>329, :title=>"Nocturne"}, {:artist=>"11  Wild Nothing", :audio_id=>"-137926065_456239193_8af2cb333c34d6d69e_0fe5bee48e92f1f150", :length=>320, :title=>"Nocturne"}, {:artist=>"Wild Nothing", :audio_id=>"85112205_206375563_bcd369f3a9d71aaa84_d72b01c08f33242ddb", :length=>320, :title=>"Nocturne (zaycev.net)"}, {:artist=>"Wild Nothing", :audio_id=>"-44640094_456242121_eb8fbe933dd91da520_e2f65951f9b273066e", :length=>329, :title=>"Nocturne (Live from Brooklyn Steel)"}, {:artist=>"04 Wild Nothing", :audio_id=>"2000195956_324723570_10cc33d98a7e1d3c1f_4dd08ec6c26ecfc7ea", :length=>320, :title=>"Nocturne [MirrorLess052 - Nocturne]"}, {:artist=>"Wild Nothing", :audio_id=>"346919962_456239019_cbe3b0b8f2fe203756_44d7eefc9c2575c330", :length=>320, :title=>"Nocturne"}, {:artist=>"Wild Nothing", :audio_id=>"86147289_354093074_8557a6944ea442e6ef_fd4f1fa48a688cb133", :length=>316, :title=>"Nocturne"}, {:artist=>"Neptune Weather Forecast", :audio_id=>"1240248_287527697_2126c894fbed0174f2_e536694d10fab8c91d", :length=>309, :title=>"Nocturne (Wild Nothing cover)"}, {:artist=>"Wild Nothing ", :audio_id=>"2000299822_401666077_b8d9e76cf958951731_71c2b7471ee8d063b8", :length=>2656, :title=>"Nocturne (Full Album)"}]}}
      end

      def search_albums_data
        {:search=>{:albums=>[{:artist=>"Wild Nothing", :title=>"Nocturne", :tracks=>[{:artist=>"Wild Nothing", :audio_id=>"-2001904796_58904796_5f32c5b85bf043a346_dd58bd05430650de66", :length=>258, :title=>"Shadow"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904795_58904795_fff1fed77ed73f0f69_f048ec328b2e5f660a", :length=>185, :title=>"Midnight Song"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904794_58904794_c2b4a23a2956b2ddeb_778e0f8167534138da", :length=>318, :title=>"Nocturne"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904793_58904793_0c05b2fa5c301f35a2_69972de043b7f83c86", :length=>260, :title=>"Through the Grass"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904792_58904792_c680c87f9f37243b1c_7f18c560195ea2460b", :length=>193, :title=>"Only Heather"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904791_58904791_801d2ebb6c8aeff7b2_64c7b9b511ed0ccc5c", :length=>218, :title=>"This Chain Won&#39;t Break"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904790_58904790_e38ab8967f3ec4c3f2_7ec13fbfefcb0cbc21", :length=>209, :title=>"Disappear Always"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904789_58904789_05e0256dc80f2ee6d1_41148c1abeb05dd925", :length=>330, :title=>"Paradise"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904788_58904788_e7511b73985c8c3b86_6b7b70e5791d38db2b", :length=>231, :title=>"Counting Days"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904787_58904787_3d6bb76f0d29d48134_7f29433f9950b15083", :length=>207, :title=>"The Blue Dress"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904786_58904786_d12c53914534e560df_06111b81c1d2f37f4a", :length=>235, :title=>"Rheya"}]}]}}
      end

      def audio_data
        {:tracks=>[{:artist=>"Wild Nothing", :link=>"https://cs4-1v4.vkuseraudio.net/p3/04ec2c04e7876c.mp3?extra=8WuhmTwUibVMjM0P4woFlEW85ddLnJAwMlF8XCUXBcwcVZekuoCVNBVppO-RCQsRpJORHtyiZz2QvuA1eekQHcESfjzhj3jfaokakRVGVBogcD_XAK2LdjfDZA-8rByHPGnQQnvDdn_uDu3o9jJrO9U9cP4&long_chunk=1", :title=>"Nocturne"}]}
      end

      def encoded_audio_link
        'https://vk.com/mp3/audio_api_unavailable.mp3?extra=A1HRmZiWzZz0sO5SocO1ofuVn3nAB2mOnhvFjKvHsdvOv2rcDJDYt1vFDhKODNDInLbUB3vMzvzMos9eALrSBs1olMrTBuvxCKqOoxHJlJDorc8OA2jpquXrC2ffzf91ru9cB3u1ltHmzxe6mhrMzxLSBKHKsJeXy2fUz25rBxa2EvHLrZj4Ad1HtNPKAhuWyO9LC2uVDxrWvYO5EhHZuNy2x3LFoxeVDfDPstqXDODLBMnumwnYttjLDMzVB3bZENaOoeDlCwe5zxP6qwLJl24Xm2KUzK49rguXEg90ALrSuODovNrIA25Up2S1C3jPmuu5ELPRlq#AqSYnta'
      end

      def decoded_audio_link
        'https://cs4-8v4.vkuseraudio.net/p4/ffe959a6cf6dc1.mp3?extra=PfON7zkK6Q4pEeirmBVpscu9OzHI9JmbjBjXkykqoxUaRnd2n_hoy_rtkusQ0W29Kbisb7_8tLvDNcn40nZqDG1T5dZo-z_mgHxq5zE-zOWl-EeyAwGO1oXy3Gx8WNTU1GNw5VELh4DAvEN0T-lN1DSWleM&long_chunk=1'
      end

      def track_data
        {:tracks=>[{:artist=>"Wild Nothing", :link=>"https://cs4-5v4.vkuseraudio.net/p3/b33f6e557c6f6a.mp3?extra=tCZFoNkZCubYb_IkGBwMPMjbQcx9GanNDhI-Y-9cnRvuh9J05NHrCb2GzvaRYortDQe2MQBm7qziTP_Jc5_krI5RKa-GYLpZDhudgB86ifIeZsAd_vLk0n2_Fns14UVDt6cUn67h5hQ7cRslg2no_HsjUg&long_chunk=1", :title=>"Nocturne"}]}
      end
    end
  end
end
