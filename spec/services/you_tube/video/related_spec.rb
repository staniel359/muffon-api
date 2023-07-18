RSpec.describe YouTube::Video::Related do
  subject { described_class }

  describe 'successful processing' do
    context 'when video present' do
      let(:output) do
        VCR.use_cassette 'services/youtube/video/related/success' do
          subject.call(video_id: '1aTIkQf3eRY')
        end
      end

      it { expect(output).to eq(Helpers::YouTube::Video.related_data) }
    end

    context 'when video present with next page' do
      let(:output) do
        VCR.use_cassette 'services/youtube/video/related/success_next_page' do
          subject.call(video_id: '1aTIkQf3eRY', page: 'CBQSJRILMWFUSWtRZjNlUlkyAMgBAOABAaICDSj___________8BQAAYACq7BjJzNkw2d3psQkFyaUJBb0Q4ajRBQ2czQ1Bnb0lfYy15a2Y3OTItSlNDZ1B5UGdBS0RzSS1Dd2l3cE03cXlJX1doN01CQ2dQeVBnQUtFdEktRHdvTlVrUXhZVlJKYTFGbU0yVlNXUW9EOGo0QUNpN1NQaXNLS1U5TVFVczFkWGxmYm5wMWRrdHVkMjlrWTJSME4yOVNjVFZzTWtaUFZUVmlaMWx3WlhwVVpFczRDZ1B5UGdBS0RjSS1DZ2ppNU1EYnRfbjI2a0lLQV9JLUFBb093ajRMQ082UGpNMmE1WWFyMVFFS0FfSS1BQW9Pd2o0TENJUFpyNm5WbTl5cDJ3RUtBX0ktQUFvT3dqNExDSlM2eWFfajA4V2N3QUVLQV9JLUFBb053ajRLQ05DUnJPS0xtYzNSQXdvRDhqNEFDZzNDUGdvSTFPeVpvYmpud2Zwd0NnUHlQZ0FLRHNJLUN3ajAtY1doc29TMmtzRUJDZ1B5UGdBS0RzSS1Dd2pGdXNHa2xmMnR0ODRCQ2dQeVBnQUtEY0ktQ2dqZGdkMllfckdqMmdNS0FfSS1BQW9Od2o0S0NLYmE4YTNza2NmamZnb0Q4ajRBQ2czQ1Bnb0k3ZEdmeE43ZDNjRkRDZ1B5UGdBS0RjSS1DZ2pnMXVIbXFlbmE0REVLQV9JLUFBb093ajRMQ092bW5ZYWVvNi1zOWdFS0FfSS1BQW9Od2o0S0NPYk1zTmptdFpTMkxnb0Q4ajRBQ2c3Q1Bnc0lnTGk1dlo3dmw0WFdBUW9EOGo0QUNnM0NQZ29JeDY3UDF2YmQ2UFlORWhRQUFnUUdDQW9NRGhBU0ZCWVlHaHdlSUNJa0pob0VDQUFRQVJvRUNBSVFBeG9FQ0FRUUJSb0VDQVlRQnhvRUNBZ1FDUm9FQ0FvUUN4b0VDQXdRRFJvRUNBNFFEeG9FQ0JBUUVSb0VDQklRRXhvRUNCUVFGUm9FQ0JZUUZ4b0VDQmdRR1JvRUNCb1FHeG9FQ0J3UUhSb0VDQjRRSHhvRUNDQVFJUm9FQ0NJUUl4b0VDQ1FRSlJvRUNDWVFKeW9VQUFJRUJnZ0tEQTRRRWhRV0dCb2NIaUFpSkNZag93YXRjaC1uZXh0LWZlZWQ%3D')
        end
      end

      it { expect(output).to eq(Helpers::YouTube::Video.related_next_page_data) }
    end
  end

  describe 'no processing' do
    context 'when no video_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong video_id' do
      let(:output) do
        VCR.use_cassette 'services/youtube/video/related/wrong_id' do
          subject.call(video_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
