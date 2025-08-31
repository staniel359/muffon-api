RSpec.describe SoundCloud::Utils::AccessToken do
  subject { described_class }

  describe 'successful processing' do
    let(:output) do
      VCR.use_cassette(
        'services/soundcloud/utils/access_token/success'
      ) do
        subject.call
      end
    end

    it { expect(output).to eq(soundcloud_utils_access_token) }
  end
end
