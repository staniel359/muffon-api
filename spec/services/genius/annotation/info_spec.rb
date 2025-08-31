RSpec.describe Genius::Annotation::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when annotation_id present' do
      let(:output) do
        VCR.use_cassette(
          'services/genius/annotation/info/success'
        ) do
          subject.call(
            annotation_id: '3128578'
          )
        end
      end

      it { expect(output).to eq(genius_annotation_info_data) }
    end
  end

  describe 'no processing' do
    context 'when no annotation_id given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong annotation_id' do
      let(:output) do
        VCR.use_cassette(
          'services/genius/annotation/info/wrong_id'
        ) do
          subject.call(
            annotation_id: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
