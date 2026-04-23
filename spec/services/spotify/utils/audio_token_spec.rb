RSpec.describe Spotify::Utils::AudioToken do
  subject { described_class }

  describe 'successful processing' do
    let(:output) do
      VCR.use_cassette(
        'services/spotify/utils/audio_token/success'
      ) do
        subject.call
      end
    end

    it { expect(output).to match_hash(spotify_utils_audio_token) }
  end
end
