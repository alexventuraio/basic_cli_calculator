require_relative 'spec_helper'
require_relative '../lib/calculator'

describe Calculator do
  describe 'initialization' do
    it 'should be an instance of the calculator class' do
      expect(subject).to be_an_instance_of(Calculator)
    end

    it 'has a result attribute' do
      expect(subject.result).to eq(0)
    end

    it 'has a result attribute that is read-only' do
      subject.result = 3 if subject.respond_to? :result=

      expect(subject.result).to eq(0)
      expect(subject).to respond_to :result
      expect(subject).to_not respond_to :result=
    end
  end
end
