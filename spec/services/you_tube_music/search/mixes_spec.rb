RSpec.describe YouTubeMusic::Search::Mixes do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette(
          'services/youtubemusic/search/mixes/success'
        ) do
          subject.call(
            query: '80s'
          )
        end
      end

      it { expect(output).to eq(youtube_music_search_mixes_data) }
    end

    context 'when query present with next page' do
      let(:output) do
        VCR.use_cassette(
          'services/youtubemusic/search/mixes/success_next_page'
        ) do
          subject.call(
            query: '80s',
            page: 'EvQJEgM4MHMa7AlFZ2VLQVFRb0FEZ0JTQlJxREJBT0VBb1FBeEFFRUFrUUJZSUJLMUpFUTB4QlN6VjFlVjl1Tm1seFRtaEVXRkpvYzFad1pEVTFaVWRyY0ROdVpFZFBVa05JWTBzeU1rV0NBU3RTUkVOTVFVczFkWGxmYlZkM1pXWnFSVzFQWXkxaFNVd3dlVFZqWlRWb2NuVnlOaTFJVUVWSVVuTk5nZ0VyVWtSRFRFRkxOWFY1WDJ0alRWTkxXbXg2TjNoMlRHbzFRMFprZW5oalpVSktVbTVtTVRSNlYxTmhOSUlCSzFKRVEweEJTelYxZVY5ck1rMDNRblZuTTFwMlZqWk9aMWs0VVV4elUwNVFSRFZKTFVGUmVqZDNUVy1DQVN0U1JFTk1RVXMxZFhsZmJIZG1XVkpWV1VOc1JqWm9WV1F3WkdsNGRVeGtOVk0zU1RWeU4wTlJiMFZ2Z2dFclVrUkRURUZMTlhWNVgyeG1PRzlyWjJ3eWVXZEVNRGMxYm1odVNsWnFiR1pvZDNBNFRuTlZaMFZpYzRJQksxSkVRMHhCU3pWMWVWOXJSVXRVVUV0Q1F6RjJOMnh0VWpaMVNXUnhSSEEyYW1jMFVqWTNhVzFsV0hPQ0FTdFNSRU5NUVVzMWRYbGZiRTE2U0ZjMU1XbEdaekZMZURCa1h6SkZTSEI2WWs5blEzSjNkSFU0WTJkSmdnRXJVa1JEVEVGTE5YVjVYMnh0WTJSSlJVdHJVRzlqUmtoZmEyZHBaMDlMZEVsbWNqbDVaRmh0Y2psTGQ0SUJLMUpFUTB4QlN6VjFlVjl0TjBGTFZuWTRkMUIyWDJ0bFRrcFRkMWQ2WWpjM2EyUlBVRU4zUWtkVVdXdUNBU3RTUkVOTVFVczFkWGxmYmtOYWFVZ3hkV1pFUlVzNVlWSnZhUzE0YVhCaWRHZEVhVGxpWjAxeFZtcE5nZ0VyVWtSRFRFRkxOWFY1WDI1MWN6RjNaa0ZWTkRSdmRqaEpOa2RxUWxkVlkyVTNkRTVoYm10WU1tRTVkNElCSzFKRVEweEJTelYxZVY5dFNtZERaak5KYldsQ1p5MVhPR0ZRU0hkc1VUSm9hMGxVWDA5V05YbFFaelNDQVN0U1JFTk1RVXMxZFhsZmJVcElURE14WVRSM2MzZHZhMDVuVkZkT00xSnVURzEyUlVodExUaG1aa0pSZ2dFclVrUkRURUZMTlhWNVgyeDJkWFZvYkRKc2VYaENZWE5XVTJ4UlZESmpibWN3WjNKMFdqVjFXbUV6YjRJQksxSkVRMHhCU3pWMWVWOXRVbEJuWTBGeGNqVlVVazQxWldKVE9HZDFVa2cwV2tWYVpGaFBiV3B2WW5PQ0FTdFNSRU5NUVVzMWRYbGZiV0ZEVm1GdFEyOXpXVXgwZWpkTlVsZGZkVTVRZVhGRFpFMTNXakZHVkV4emdnRXJVa1JEVEVGTE5YVjVYMncyYTB4ZllqVXdWMEo1WkdkYWNqRTRlVkpyTVdGNFlVSmhiakJTTm1oQmE0SUJLMUpFUTB4QlN6VjFlVjlyTVZkMU9GRmlXa0ZUYVVkV2NYSXhkMjFwWlRsT1NWbHZNemhoUW5GelkxR0NBU3RTUkVOTVFVczFkWGxmYkhSNlVsSnpVM1ZIVjJkQmFHNDJTSFJGVFhrNFEwVllRelJZVjJrNWJEVlIY8erQLg%3D%3D'
          )
        end
      end

      it { expect(output).to eq(youtube_music_search_mixes_next_page_data) }
    end
  end

  describe 'no processing' do
    context 'when no query given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        VCR.use_cassette(
          'services/youtubemusic/search/mixes/wrong_query'
        ) do
          subject.call(
            query: random_string
          )
        end
      end

      it { expect(output).to eq(youtube_no_mixes_data) }
    end
  end
end
