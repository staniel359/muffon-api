RSpec.describe LastFM::Releases::New do
  subject { described_class }

  describe 'successful processing' do
    let(:output) do
      VCR.use_cassette 'services/lastfm/releases/new/success' do
        subject.call(page: 2, profile_id: 1)
      end
    end

    it { expect(output).to eq(Helpers::LastFM::Releases.new_data) }
  end
end
