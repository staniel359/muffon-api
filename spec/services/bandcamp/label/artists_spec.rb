RSpec.describe Bandcamp::Label::Artists do
  subject { described_class }

  describe 'successful processing' do
    context 'when label present' do
      let(:output) do
        VCR.use_cassette(
          'services/bandcamp/label/artists/success'
        ) do
          subject.call(
            label_id: '2304199212',
            page: '2',
            limit: '5'
          )
        end
      end

      it { expect(output).to eq(bandcamp_label_artists_data) }
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
          'services/bandcamp/label/artists/wrong_label'
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
