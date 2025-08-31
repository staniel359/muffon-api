RSpec.describe Bandcamp::Label::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when label present' do
      let(:output) do
        VCR.use_cassette(
          'services/bandcamp/label/albums/success'
        ) do
          subject.call(
            label_id: '2304199212',
            limit: 5,
            page: 2
          )
        end
      end

      it { expect(output).to eq(bandcamp_label_albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no args' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong label' do
      let(:output) do
        VCR.use_cassette(
          'services/bandcamp/label/albums/wrong_label'
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
