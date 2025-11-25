RSpec.describe LastFM::Tag::Artists do
  subject { described_class }

  describe 'successful processing' do
    context 'when tag exists' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/tag/artists/success'
        ) do
          subject.call(
            tag_name: 'dream pop',
            page: '2',
            limit: '5',
            profile_id: '1'
          )
        end
      end

      it { expect(output).to eq(lastfm_tag_artists_data) }
    end
  end

  describe 'no processing' do
    context 'when no tag name given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong tag name' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/tag/artists/wrong_name'
        ) do
          subject.call(
            tag_name: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
