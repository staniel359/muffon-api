module Helpers
  module SoundCloud
    module Track
      class << self
        def info_data
          {:track=>{:artist=>{:name=>"scubb"}, :artists=>[{:name=>"scubb", :soundcloud_id=>247403880}], :audio=>{:link=>"https://api.soundcloud.com/tracks/296774474/stream?client_id=#{client_id}", :present=>true, :source_id=>"soundcloud"}, :description=>"Luxury Elite's All Night\nLate Night Delight (c) Luxury Elite", :duration=>"00:46", :image=>{:extrasmall=>"https://i1.sndcdn.com/artworks-000197371808-7uwudi-t67x67.jpg", :large=>"https://i1.sndcdn.com/artworks-000197371808-7uwudi-t500x500.jpg", :medium=>"https://i1.sndcdn.com/artworks-000197371808-7uwudi-t300x300.jpg", :original=>"https://i1.sndcdn.com/artworks-000197371808-7uwudi-t500x500.jpg", :small=>"https://i1.sndcdn.com/artworks-000197371808-7uwudi-large.jpg"}, :soundcloud_id=>296774474, :tags=>[{:name=>"V A P O R W A V E"}], :title=>"LUXURY ELITE - ALL NIGHT", :player_id=>"1", :with_more=>{:description=>false, :tags=>false}}}
        end

        private

        def client_id
          Rails.application.credentials.soundcloud[:api_key]
        end
      end
    end
  end
end
