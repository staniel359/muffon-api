RSpec.describe Discogs::Label::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when label_id given' do
      let(:output) do
        VCR.use_cassette(
          'services/discogs/label/albums/success'
        ) do
          subject.call(
            label_id: '26126',
            page: '2',
            limit: '5',
            profile_id: '1'
          )
        end
      end

      it { expect(output).to eq(discogs_label_albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no label_id given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong label_id' do
      let(:output) do
        VCR.use_cassette(
          'services/discogs/label/albums/wrong_id'
        ) do
          subject.call(
            label_id: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
