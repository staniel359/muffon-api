RSpec.describe YouTube::Video::Tags do
  subject { described_class }

  describe 'successful processing' do
    context 'when video present' do
      let(:output) do
        VCR.use_cassette(
          'services/youtube/video/tags/success'
        ) do
          subject.call(
            video_id: '1aTIkQf3eRY'
          )
        end
      end

      it { expect(output).to eq(youtube_video_tags_data) }
    end
  end

  describe 'no processing' do
    context 'when no video_id given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong video_id' do
      let(:output) do
        VCR.use_cassette(
          'services/youtube/video/tags/wrong_id'
        ) do
          subject.call(
            video_id: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
