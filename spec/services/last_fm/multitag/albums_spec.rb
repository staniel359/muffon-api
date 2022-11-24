RSpec.describe LastFM::Multitag::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when tags present' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/multitag/albums/success' do
          subject.call(tags: %w[80s pop], limit: 5, page: 2, profile_id: 1)
        end
      end

      it { expect(output).to eq(Helpers::LastFM::Multitag.albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no tags' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong tags' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/multitag/albums/wrong_query' do
          subject.call(tags: [random])
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
