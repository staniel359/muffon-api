RSpec.describe AmazonMusic::Utils::Token do
  subject { described_class }

  describe 'successful processing' do
    let(:output) do
      VCR.use_cassette(
        'services/amazonmusic/utils/token/success'
      ) do
        subject.call
      end
    end

    it { expect(output).to eq(amazonmusic_utils_token) }
  end
end
