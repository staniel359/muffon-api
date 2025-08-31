RSpec.describe LastFM::Tag::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when tag exists' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/tag/info/success'
        ) do
          subject.call(
            tag_name: 'dream pop'
          )
        end
      end

      it { expect(output).to eq(lastfm_tag_info_data) }
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
          'services/lastfm/tag/info/wrong_name'
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
