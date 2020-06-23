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

  describe 'basic operations' do
    subject(:calc) { described_class.new }

    before(:example) do
      calc.add(2)
    end

    it 'can add' do
      calc.add(3)
      expect(calc.result).to eq(5)
    end

    it 'can subtract' do
      calc.subtract(1)
      expect(calc.result).to eq(1)
    end

    it 'can multiply' do
      calc.multiply(2)
      expect(calc.result).to eq(4)
    end

    it 'can divide' do
      calc.divide(4)
      expect(calc.result).to eq(0.5)
    end
  end
end
