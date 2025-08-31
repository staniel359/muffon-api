RSpec.describe Spotify::Utils::Token do
  subject { described_class }

  describe 'successful processing' do
    let(:output) do
      VCR.use_cassette(
        'services/spotify/utils/token/success'
      ) do
        subject.call
      end
    end

    it { expect(output).to eq(spotify_utils_access_token) }
  end
end
