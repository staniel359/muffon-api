module Helpers
  module Bandcamp
    module Track
      class << self
        def info_data
          {:track=>{:album=>"Indigo", :artist=>"Wild Nothing", :audio=>{:link=>"https://t4.bcbits.com/stream/210d5388506737316a14c2884cf27ca2/mp3-128/2723372494?p=0&ts=1608986240&t=f22add79bc64db51b27e3d53d52cafa604375b8c&token=1608986240_715b12fd44c1f188e298e788998e3273e71653b5", :present=>true, :source=>"bandcamp"}, :id=>1, :images=>{:extrasmall=>"https://f4.bcbits.com/img/a3221996752_42.jpg", :large=>"https://f4.bcbits.com/img/a3221996752_5.jpg", :medium=>"https://f4.bcbits.com/img/a3221996752_4.jpg", :original=>"https://f4.bcbits.com/img/a3221996752_10.jpg", :small=>"https://f4.bcbits.com/img/a3221996752_3.jpg"}, :length=>221, :title=>"Letting Go"}}
        end
      end
    end
  end
end