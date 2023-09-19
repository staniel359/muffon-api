RSpec.describe GitHub::Releases do
  subject { described_class }

  describe 'successful processing' do
    let(:output) do
      VCR.use_cassette 'services/github/releases/success' do
        subject.call(limit: 5, page: 2)
      end
    end

    it { expect(output).to eq(Helpers::GitHub.releases_data) }
  end
end
