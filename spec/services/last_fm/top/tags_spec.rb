RSpec.describe LastFM::Top::Tags do
  subject { described_class }

  describe 'successful processing' do
    context 'when no primary args' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/top/tags/success'
        ) do
          subject.call(
            page: '2',
            limit: '5'
          )
        end
      end

      it { expect(output).to eq(lastfm_top_tags_data) }
    end
  end
end
