RSpec.describe LastFM::Top::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when no primary args' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/top/albums/success' do
          subject.call(limit: 5, page: 2, profile_id: 1)
        end
      end

      it { expect(output).to eq(Helpers::LastFM::Top.albums_data) }
    end
  end
end
