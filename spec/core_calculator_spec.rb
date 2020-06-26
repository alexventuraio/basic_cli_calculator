require_relative 'spec_helper'
require_relative '../lib/core_calculator'

describe CoreCalculator do
  describe 'initialization' do
    it 'should be an instance of the core core_calculator class' do
      expect(subject).to be_an_instance_of(CoreCalculator)
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

    it 'can reset' do
      calc.reset
      expect(calc.result).to eq(0)
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

  describe 'operation methods using "execute" method' do
    subject(:calc) { described_class.new }

    before(:example) do
      calc.add(2)
    end

    it 'can add with ("add", value)' do
      calc.execute('add', 4)
      expect(calc.result).to eq(6)
    end

    it 'can subtract with ("subtract", value)' do
      calc.execute('subtract', 5)
      expect(calc.result).to eq(-3)
    end

    it 'can divide with ("divide", value)' do
      calc.execute('divide', 4)
      expect(calc.result).to eq(0.5)
    end

    it 'can multiply with ("multiply", value)' do
      calc.execute('multiply', 10)
      expect(calc.result).to eq(20)
    end
  end
end
