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

  describe 'no processing' do
    context 'when wrong page' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/releases/upcoming/wrong_page' do
          subject.call(page: 10_000)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
