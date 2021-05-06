module Helpers
  module Discogs
    module Search
      class << self
        def albums_data
          {:search=>{:albums=>[{:discogs_group_id=>119657, :discogs_id=>1944543, :format=>"Vinyl, LP, Mini-Album, Limited Edition, Compilation", :image=>"https://img.discogs.com/_9TkWYcGrDxK7iAvxAFECKCsHHg=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-1944543-1394392510-9359.jpeg.jpg", :released=>"1983", :title=>"Kate Bush - Kate Bush"}, {:discogs_group_id=>119657, :discogs_id=>4951656, :format=>"Vinyl, LP, Mini-Album, Compilation", :image=>"https://img.discogs.com/1Dx8cXD6QXCnRqZqKC3ig6PUyIk=/fit-in/280x280/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-4951656-1380388875-8040.jpeg.jpg", :released=>"1983", :title=>"Kate Bush - Kate Bush"}, {:discogs_group_id=>119657, :discogs_id=>2385486, :format=>"Vinyl, LP, Mini-Album, Compilation, Limited Edition", :image=>"https://img.discogs.com/OMqn9dX1iIasGFVwJ0SN7Ws8C4E=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-2385486-1329571532.jpeg.jpg", :released=>"1983", :title=>"Kate Bush - Kate Bush"}, {:discogs_group_id=>0, :discogs_id=>2858958, :format=>"Vinyl, 12\", 33 ⅓ RPM, Promo, Sampler", :image=>"https://img.discogs.com/iTa77EayZUIpEeGDS3nJV-F3v4w=/fit-in/255x255/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-2858958-1304315838.jpeg.jpg", :released=>"1982", :title=>"Kate Bush - Kate Bush"}, {:discogs_group_id=>119657, :discogs_id=>2385472, :format=>"Vinyl, LP, Mini-Album, Limited Edition, Compilation", :image=>"https://img.discogs.com/-qNIVQUVM195tS-QpsvZ0lOl1e8=/fit-in/433x450/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-2385472-1280948928.jpeg.jpg", :released=>"1983", :title=>"Kate Bush - Kate Bush"}], :page=>2, :total_pages=>1326}}
        end

        def artists_data
          {:search=>{:artists=>[{:discogs_id=>894348, :image=>"https://img.discogs.com/44ee095fadda529481bcc7ef36c882a13a60df73/images/spacer.gif", :name=>"Dr. Bush"}, {:discogs_id=>4826440, :image=>"https://img.discogs.com/44ee095fadda529481bcc7ef36c882a13a60df73/images/spacer.gif", :name=>"Kate Bush Visuals"}, {:discogs_id=>7929076, :image=>"https://img.discogs.com/44ee095fadda529481bcc7ef36c882a13a60df73/images/spacer.gif", :name=>"Kate's Bush (2)"}, {:discogs_id=>4253308, :image=>"https://img.discogs.com/tTv-8fd-vNHByCa9GqhjnGcMT3U=/487x362/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-4253308-1424003200-8672.jpeg.jpg", :name=>"KT Bush Band"}, {:discogs_id=>2222811, :image=>"https://img.discogs.com/lBlC5vaoJxwiK8do7s4-LLzG77k=/374x369/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-2222811-1607794608-8769.jpeg.jpg", :name=>"Nick Price (2)"}], :page=>2, :total_pages=>23}}
        end

        def groups_data
          {:search=>{:groups=>[{:discogs_id=>28680, :format=>"CD, Album", :image=>"https://img.discogs.com/eaRPicce1W5US9W1UGo5aukMbyA=/fit-in/600x590/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-16233996-1605730391-7184.jpeg.jpg", :released=>"1985", :title=>"Kate Bush - Hounds Of Love"}, {:discogs_id=>28531, :format=>"Vinyl, LP, Album, Stereo", :image=>"https://img.discogs.com/l4tj9nFGF6KgmETZZPwox8pC06w=/fit-in/600x598/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-414374-1411407209-7587.jpeg.jpg", :released=>"1978", :title=>"Kate Bush - The Kick Inside"}, {:discogs_id=>28522, :format=>"Vinyl, LP, Album, Stereo", :image=>"https://img.discogs.com/noGLOKfZ82etdLvvfdONrWuKgk0=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-426108-1558297258-5571.jpeg.jpg", :released=>"1978", :title=>"Kate Bush - Lionheart"}, {:discogs_id=>28582, :format=>"Vinyl, LP, Album", :image=>"https://img.discogs.com/4Q2fb_Xl3livj4xYonoeXM1lQb4=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-508248-1474741790-3505.jpeg.jpg", :released=>"1980", :title=>"Kate Bush - Never For Ever"}, {:discogs_id=>28732, :format=>"Vinyl, LP, Compilation", :image=>"https://img.discogs.com/nQIG-Cy8maIH3HumXzYkM_8QXmo=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-310245-1375463802-5512.jpeg.jpg", :released=>"1986", :title=>"Kate Bush - The Whole Story"}], :page=>2, :total_pages=>131}}
        end

        def labels_data
          {:search=>{:labels=>[{:discogs_id=>735999, :image=>"https://img.discogs.com/wQjfdi_0QwxqavX1Ydow6G8kdPw=/fit-in/600x626/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/L-735999-1410293356-6598.jpeg.jpg", :title=>"Kate Bush Paper Sleeve Collection"}, {:discogs_id=>389241, :image=>"https://img.discogs.com/44ee095fadda529481bcc7ef36c882a13a60df73/images/spacer.gif", :title=>"Kate Bush Music, Inc."}, {:discogs_id=>1718396, :image=>"https://img.discogs.com/44ee095fadda529481bcc7ef36c882a13a60df73/images/spacer.gif", :title=>"Kate Bush Music Publishing"}, {:discogs_id=>245607, :image=>"https://img.discogs.com/WPdM8Q65T98cJw10JV0wRmE_rHs=/fit-in/510x408/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/L-245607-1305647853.jpeg.jpg", :title=>"Fish People"}, {:discogs_id=>398039, :image=>"https://img.discogs.com/44ee095fadda529481bcc7ef36c882a13a60df73/images/spacer.gif", :title=>"Noble And Brite"}], :page=>2, :total_pages=>4}}
        end
      end
    end
  end
end