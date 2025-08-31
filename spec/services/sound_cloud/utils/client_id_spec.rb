RSpec.describe SoundCloud::Utils::ClientId do
  subject { described_class }

  describe 'successful processing' do
    let(:output) do
      VCR.use_cassette(
        'services/soundcloud/utils/client_id/success'
      ) do
        subject.call
      end
    end

    it { expect(output).to eq(soundcloud_utils_client_id) }
  end
end
