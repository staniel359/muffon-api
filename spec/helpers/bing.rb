module Helpers
  module Bing
    class << self
      def bad_request_error
        { error: { code: 400, text: 'Bad request' } }
      end

      def not_found_error
        { error: { code: 404, text: 'Not found' } }
      end

      def search_data
        {:search=>{:page=>1, :results=>[{:description=>"6/5/2018 · Indigo by Wild Nothing, released 31 August 2018 1. Letting Go 2. Oscillation 3. Partners in Motion 4. Wheel of Misfortune 5. Shallow Water 6. Through Windows 7. The Closest Thing to Living 8. Dollhouse 9. Canyon on Fire 10. Flawed Translation 11. Bend Although civilization’s transition into a cyborg world seems inevitable, there are still those who recognize the beauty and power of a human ...", :link=>"https://wildnothingct.bandcamp.com/album/indigo", :title=>"Indigo | Wild Nothing"}, {:description=>"Wild Nothing. Blacksburg, Virginia. Ask Jack Tatum what ‘Wild Nothing’ means and he’ll answer: ‘a contradiction’. In 2010, 21 year old Tatum released one of the finest cult pop records of the summer whilst ensconced in his senior year of college in Blacksburg, …", :link=>"https://wildnothingct.bandcamp.com/", :title=>"Music | Wild Nothing"}, {:description=>"Buy Indigo Tour Video Store. T o u r. Follow Wild Nothing on Bandsintown / Songkick. V i d e o. Partners In Motion. Letting Go. To Know You / TV Queen. A Dancing Shell. Paradise. Follow Wild Nothing on Youtube. P h o t o. Follow Wild Nothing on Instagram. S i g n U p. SUBSCRIBE ...", :link=>"http://www.wildnothingmusic.com/", :title=>"Wild Nothing / Indigo"}, {:description=>"From the opening drum beat, chiming guitar, and sweeping synth of “Letting Go” to Tatum’s Bryan Ferry vocal turn on “Oscillation” to the ’80s-heavy blips, clicks, and strut of “Partners in Motion,” it’s clear that Indigo is at once vintage Wild Nothing and a bold, new leap into a bigger arena.", :link=>"https://capturedtracks.com/artist/wild-nothing/", :title=>"Wild Nothing // Captured Tracks"}, {:description=>"Wild Nothing, the project of Los Angeles-based Jack Tatum, announces his fourth album, Indigo, out August 31st, along with new single, “Letting Go,” and North American tour! Indigo is its own cyborg world, utilizing the artful mechanisms of human touch with the precision of technology to create the classic, pristine sound Tatum has been ...", :link=>"https://capturedtracks.com/wild-nothing-returns-with-indigo/", :title=>"Wild Nothing Returns with ‘Indigo’ // Captured …"}]}}
      end
    end
  end
end
