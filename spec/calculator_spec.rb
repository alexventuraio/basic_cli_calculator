require_relative 'spec_helper'
require_relative '../lib/calculator'

describe Calculator do
  describe 'initialization' do
    it 'should be an instance of the calculator class' do
      expect(subject).to be_an_instance_of(Calculator)
    end

    it 'should have a valid core_calculator instance' do
      expect(subject.instance_variable_get(:@calc)).not_to be_nil
      expect(subject.instance_variable_get(:@calc)).to be_an_instance_of(CoreCalculator)
    end

    it 'has a responds to call method' do
      expect(subject).to respond_to :call
    end
  end
end
