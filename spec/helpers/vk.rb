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
        {:search=>{:tracks=>[{:artist=>"Wild Nothing", :audio_id=>"371745467_456356977_36b075f9ae3c6331d9_d83be484666c39875a", :length=>318, :title=>"Nocturne"}, {:artist=>"Wild Nothing", :audio_id=>"-2001472574_55472574_f5c8e1b60afdb5432a_0844078aec29557b6c", :length=>329, :title=>"Nocturne"}, {:artist=>"11  Wild Nothing", :audio_id=>"-137926065_456239193_8cd329a0871fb0756d_9fbf1a48fdbef97b50", :length=>320, :title=>"Nocturne"}, {:artist=>"Wild Nothing", :audio_id=>"-44640094_456242121_e390d03c5001126e18_acb1aafcde5d911199", :length=>329, :title=>"Nocturne (Live from Brooklyn Steel)"}, {:artist=>"Wild Nothing", :audio_id=>"85112205_206375563_ae50391d019b0c468d_c73afb0bf202ea8e7a", :length=>320, :title=>"Nocturne (zaycev.net)"}, {:artist=>"04 Wild Nothing", :audio_id=>"2000195956_324723570_a1824c685e5513f0d4_81430e3204a38d73c9", :length=>320, :title=>"Nocturne [MirrorLess052 - Nocturne]"}, {:artist=>"Wild Nothing", :audio_id=>"346919962_456239019_f53506d5d7d0e94512_2c26ec2150e3c0f581", :length=>320, :title=>"Nocturne"}, {:artist=>"Wild Nothing", :audio_id=>"86147289_354093074_9f5049ba4cbf304de1_04ba9753c0ea99be58", :length=>316, :title=>"Nocturne"}, {:artist=>"Wild Nothing", :audio_id=>"260660001_352262536_17a9791b826d76e5df_0a6ea1f9b364a81e1c", :length=>2656, :title=>"Nocturne (2012, Full Album)"}, {:artist=>"Neptune Weather Forecast", :audio_id=>"1240248_287527697_e7b7d095b2e09a5fdc_0997ecbd7c72a0831e", :length=>309, :title=>"Nocturne (Wild Nothing cover)"}, {:artist=>"Wild Nothing ", :audio_id=>"2000299822_401666077_293c2bf43904613ca7_682c2fb3f51f9155eb", :length=>2656, :title=>"Nocturne (Full Album)"}]}}
      end

      def search_albums_data
        {:search=>{:albums=>[{:artist=>"Wild Nothing", :title=>"Nocturne", :tracks=>[{:artist=>"Wild Nothing", :audio_id=>"-2001904796_58904796_6ff886a53860363b0a_e72fdc30acc9369248", :length=>258, :title=>"Shadow"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904795_58904795_58f07bec3155eab30a_48309a2bebde3c7ef1", :length=>185, :title=>"Midnight Song"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904794_58904794_e7a8bd2370542cbe9f_3dd710da11635b90e3", :length=>318, :title=>"Nocturne"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904793_58904793_b1548f389238d13050_d63347480ddf399fd8", :length=>260, :title=>"Through the Grass"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904792_58904792_5a744f6773d37b8af5_2493618f2fa3249a78", :length=>193, :title=>"Only Heather"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904791_58904791_9fa81de1822da527ef_c03443cb8bb3f29754", :length=>218, :title=>"This Chain Won&#39;t Break"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904790_58904790_f338ae4f1bb3217056_3dd846e53e9b409a88", :length=>209, :title=>"Disappear Always"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904789_58904789_bee95e63be8f8d5a16_358184d0fd09518c47", :length=>330, :title=>"Paradise"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904788_58904788_6eabe0c531e7817c99_8815e645eb61fe27e1", :length=>231, :title=>"Counting Days"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904787_58904787_4217417662661e971f_f2bb111782499b117c", :length=>207, :title=>"The Blue Dress"}, {:artist=>"Wild Nothing", :audio_id=>"-2001904786_58904786_120a817d18f76bca38_5b5bd09bc5be82bdc7", :length=>235, :title=>"Rheya"}]}]}}
      end

      def audio_data
        {:tracks=>[{:artist=>"Wild Nothing", :link=>"https://cs4-1v4.vkuseraudio.net/p3/357172ef7c4ae5.mp3?extra=eOtUulf_nXXFggmyxEZoYVzek-F8XWVF4W0IrHlRBoztJnJop9B9bQVeS02U0VqLQz4elPMTN6Mc9XX7Ghmrwv-5LED2hFK-kkODSCJpRA_gd1pMm3Tt8byvpSnScHxq9k6pt6EedrMm_bdJGz08XwK88Q&long_chunk=1", :title=>"Nocturne"}]}
      end

      def encoded_audio_link
        'https://vk.com/mp3/audio_api_unavailable.mp3?extra=A1HRmZiWzZz0sO5SocO1ofuVn3nAB2mOnhvFjKvHsdvOv2rcDJDYt1vFDhKODNDInLbUB3vMzvzMos9eALrSBs1olMrTBuvxCKqOoxHJlJDorc8OA2jpquXrC2ffzf91ru9cB3u1ltHmzxe6mhrMzxLSBKHKsJeXy2fUz25rBxa2EvHLrZj4Ad1HtNPKAhuWyO9LC2uVDxrWvYO5EhHZuNy2x3LFoxeVDfDPstqXDODLBMnumwnYttjLDMzVB3bZENaOoeDlCwe5zxP6qwLJl24Xm2KUzK49rguXEg90ALrSuODovNrIA25Up2S1C3jPmuu5ELPRlq#AqSYnta'
      end

      def decoded_audio_link
        'https://cs4-8v4.vkuseraudio.net/p4/ffe959a6cf6dc1.mp3?extra=PfON7zkK6Q4pEeirmBVpscu9OzHI9JmbjBjXkykqoxUaRnd2n_hoy_rtkusQ0W29Kbisb7_8tLvDNcn40nZqDG1T5dZo-z_mgHxq5zE-zOWl-EeyAwGO1oXy3Gx8WNTU1GNw5VELh4DAvEN0T-lN1DSWleM&long_chunk=1'
      end

      def track_data
        {:track=>[{:artist=>"Wild Nothing", :link=>"https://cs4-5v4.vkuseraudio.net/p3/357c78608657a9.mp3?extra=6EW7z2xIUVkOJ6OPIztx6MQVlLPvJ7gMEkrKi7YPn215_qkv0tdqr7pwstL0k_ZnGx6inFFWFE5FtsNohqX7QG3jThJt46Jly0keZHuf3T5rgYxKImTM1c4OnJf8hMFWmswiv6W-yoWjB23ClOsStvUG&long_chunk=1", :title=>"Nocturne"}]}
      end

      def remixsid
        '754b37ed73df0c84ee4a5b7eefda6ba1a6ba743be7b9b93cb5fcf04e6415b'
      end
    end
  end
end
