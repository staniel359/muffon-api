RSpec.describe YouTubeMusic::Search::Playlists do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette 'services/youtubemusic/search/playlists/success' do
          subject.call(query: '80s')
        end
      end

      it { expect(output).to eq(Helpers::YouTubeMusic::Search.playlists_data) }
    end

    context 'when query present with next page' do
      let(:output) do
        VCR.use_cassette 'services/youtubemusic/search/playlists/success_next_page' do
          subject.call(query: '80s', page: 'ErIHEgM4MHMaqgdFZ2VLQVFRb0FFQUJTQlJxREJBT0VBb1FBeEFFRUFrUUJZSUJJbEJNYlZoNGNWTktTbkV0ZVZoeVExQkhTVlF5WjI0NFlqTTBTbXBQY213MFdHYUNBU0pRVEdRNVlYVklORXBKU0haMWNHOU5aMWMxV1daUGFuRjBhalpNYVdnd1RVdDNnZ0VTVUV4RFJEQTBORFZETlRkR01rSTNSalF4Z2dFaVVFeDZVazR0YW1nNE5WcDRWV1UxTlVKUmRtSlVMVGQxYUdOWmVGVkhiR05GUklJQkVsQk1Remt3UmtJM01VWTJSVU5GTVRkR000SUJJbEJNYlZoNGNWTktTbkV0ZVZaWGNGSkdSMGx0U0ZsYVFsRlVkVUpIVEdwSE5IU0NBU0pRVEdoblpYSkNXVFYxUzNkVWVtTmlaM0ZRVm1OUVJHVjBiMjluWlVwNU0waGlnZ0VpVUV3MlIwMUhaa1F0TkhWMVdFSnJhamRsYjJaTGREWlNTVlpGUm1admNETmFNSUlCSWxCTWEwWTRlalJmY2tWcFNHZGhhVlJxYVZnMmJsZHJVbDlIUlRjeFlUbENiRUtDQVNKUVREUk5RbFp2Vm1GdFVrMTVZemRaYjFkR1MxVXRSMGg0TkV0TE5XOXBhRGd5Z2dFaVVFeFhXV3M0VG5sVE9GWlhORVJqTUhOek9YQjFUMk0wV0daRWRXSnpNMkp3WTRJQkVsQk1Nekl4TUVKRE5ESTNOamhETmtFNE9JSUJJbEJNY0ZsWFMwZE5aMUpCTVhWVk9XeDVUWFJTT0haUlFucGpORWh5YW5CeFdYV0NBU0pRVEVWWGMwaHRXR2RGWkZWVFpYTXlVbWt5ZFZsaFZtMTRTbWRuVG5CamFFTTBnZ0VTVUV3MVFUZEVPVVk1TWprMU5EZzVRVVJCZ2dFaVVFd3ljSFJvTldGaGFqUjRjbEV6WkZSbk0zUmlWRXR1VHpSTWRFTlBkV1l6YklJQklsQk1SMEoxUzJadVJYSmFiRVJpYW5FNFZERlVRVFJ0U0dwSllVeG1OemRwUWstQ0FTSlFUR3A1Y1RBeVFrWk5SV1JIYm5sWWJEaExNbVJ3TWpsVFpXTnBNRFF6WjFoU2dnRWlVRXh3YkZoUk1tTm5PVUpmYnpGWUxVdHVaRFYzWjJKQmFTMVpSRlJUWW0xNUxZSUJJbEJNTTBWbU5rVnJaRzl4ZW5JemVXcEZiVWhXUTBJdGVGQXdibXg0Ymt0RVgyTSUzRBjx6tAu')
        end
      end

      it { expect(output).to eq(Helpers::YouTubeMusic::Search.playlists_next_page_data) }
    end
  end

  describe 'no processing' do
    context 'when no query given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        VCR.use_cassette 'services/youtubemusic/search/playlists/wrong_query' do
          subject.call(query: random)
        end
      end

      it { expect(output).to eq(Helpers::Search.youtube_no_playlists_data) }
    end
  end
end
