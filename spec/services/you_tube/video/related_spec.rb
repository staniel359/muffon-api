RSpec.describe YouTube::Video::Related do
  subject { described_class }

  describe 'successful processing' do
    context 'when video present' do
      let(:output) do
        VCR.use_cassette(
          'services/youtube/video/related/success'
        ) do
          subject.call(
            video_id: '1aTIkQf3eRY'
          )
        end
      end

      it { expect(output).to eq(youtube_video_related_data) }
    end

    context 'when video present with next page' do
      let(:output) do
        VCR.use_cassette(
          'services/youtube/video/related/success_next_page'
        ) do
          subject.call(
            video_id: '1aTIkQf3eRY',
            page: 2
          )
        end
      end

      it { expect(output).to eq(youtube_video_related_next_page_data) }
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
          'services/youtube/video/related/wrong_id'
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
