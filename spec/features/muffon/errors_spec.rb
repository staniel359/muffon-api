require 'rails_helper'

RSpec.describe Muffon::Errors do
  subject { described_class }

  describe 'successful processing' do
    let(:not_found) { { error: { code: 404, text: 'Not found' } } }

    context 'when calling list' do
      let(:output) { subject.list }

      it { expect(output).to be_an(Array) }
      it { expect(output.size).not_to eq(0) }
    end

    context 'when handle existing error' do
      let(:output) { subject.handle(RestClient::NotFound) }

      it { expect(output).to eq(not_found) }
    end

    context 'when calling handler' do
      let(:output) { subject.handlers.not_found }

      it { expect(output).to eq(not_found) }
    end
  end

  describe 'no processing' do
    context 'when handle unexisting error' do
      let(:output) { subject.handle(StandardError) }

      it { expect(output).to eq(nil) }
    end
  end
end
