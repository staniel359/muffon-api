RSpec.describe Spotify::Utils::ClientToken do
  subject { described_class }

  describe 'successful processing' do
    let(:output) do
      VCR.use_cassette(
        'services/spotify/utils/client_token/success'
      ) do
        subject.call
      end
    end

    it { expect(output).to eq(spotify_utils_client_token) }
  end
end
