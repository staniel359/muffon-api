RSpec.describe Spotify::Utils::AccessToken do
  subject { described_class }

  describe 'successful processing' do
    let(:output) do
      VCR.use_cassette 'services/spotify/utils/access_token/success' do
        subject.call
      end
    end

    it { expect(output).to eq(Helpers::Spotify::Utils.access_token) }
  end
end
