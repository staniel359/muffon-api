RSpec.describe YouTubeMusic::Search::Tracks do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette 'services/youtubemusic/search/tracks/success' do
          subject.call(query: 'wild nothing')
        end
      end

      it { expect(output).to eq(Helpers::YouTubeMusic::Search.tracks_data) }
    end

    context 'when query present with next page' do
      let(:output) do
        VCR.use_cassette 'services/youtubemusic/search/tracks/success_next_page' do
          subject.call(query: 'wild nothing', page: 'EqkDEgx3aWxkIG5vdGhpbmcamANFZ1dLQVFJUUFVZ1VhZ29RQ1JBREVBUVFDaEFGZ2dFTFR6RkphVVZyWVZGUFIwbUNBUXMyYUdvdGNHWkJjMkZpTklJQkMwTldPVmM0UVhOSldqaFJnZ0VMZW0wMk16WldVMUZZVlZXQ0FRdE5ZMFp5VTNCNldXRXlRWUlCQzJGVmRFUmZRa0pUWWxZNGdnRUxWWE5XZGpjdFNYTndYekNDQVF0MldqVlBlblJPUjJWYWE0SUJDMEl3UWpoRVV6SmFZMmRWZ2dFTFprUTRVbVZpTFhwSVdFR0NBUXRTVm1WcU0xOVdjVGhJYTRJQkMxaGxaM2wxU0ZwU2VYbEpnZ0VMVG5ac1NHSkdNRlYyV0UyQ0FRdFBhVlk1Wlc1QmJ6TnVVWUlCQzNkT1pIRlZNMlpRTlZSSmdnRUxVVXBoUm5WZk5rdHVlVW1DQVF0UGNtbFRiVGgwVldkcE5JSUJDMjFYYVdKME9WSlhkM1JaZ2dFTFZWRTJhWEp4YW5ad2NHLUNBUXRrZFMxVldFTlVUR1JTYnclM0QlM0QY8erQLg%3D%3D')
        end
      end

      it { expect(output).to eq(Helpers::YouTubeMusic::Search.tracks_next_page_data) }
    end
  end

  describe 'no processing' do
    context 'when no query given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        VCR.use_cassette 'services/youtubemusic/search/tracks/wrong_query' do
          subject.call(query: random)
        end
      end

      it { expect(output).to eq(Helpers::Search.youtube_no_tracks_data) }
    end
  end
end
