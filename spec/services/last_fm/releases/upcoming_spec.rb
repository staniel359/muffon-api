RSpec.describe LastFM::Releases::Upcoming do
  subject { described_class }

  describe 'successful processing' do
    let(:output) do
      VCR.use_cassette 'services/lastfm/releases/upcoming/success' do
        subject.call(page: 2, profile_id: 1)
      end
    end

    it { expect(output).to eq(Helpers::LastFM::Releases.upcoming_data) }
  end
end
