require_relative '../lib/calculator'
require_relative 'support/io_test_helpers'

RSpec.configure do |c|
  c.include IoTestHelpers
end

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

  describe 'basic arithmetic operations' do
    it 'should follow the process and return 10.0' do
      expect {
        simulate_stdin('3', '+', '2', '*', '2', '=', 'q') do
          described_class.new(silent_mode: true).call
        end
      }.to output("10.0\n").to_stdout
    end

    it 'should follow the process and return 139.6' do
      expect {
        simulate_stdin('700', '+', '-2', '/', '5', '=', 'q') do
          described_class.new(silent_mode: true).call
        end
      }.to output("139.6\n").to_stdout
    end

    it 'should follow the process and return 0' do
      expect {
        simulate_stdin('750', '/', '3', '=', '-', '249', '*', '-0.5', '+', '0.5', '=', 'q') do
          described_class.new(silent_mode: true).call
        end
      }.to output("0.0\n").to_stdout
    end

    it 'should follow the process and return `Infinity`' do
      expect {
        simulate_stdin('50', '/', '0', '=', 'q') do
          described_class.new(silent_mode: true).call
        end
      }.to output("Infinity\n").to_stdout
    end
  end

  describe 'accepted user entries' do
    it 'should accept positive numbers like `+3`' do
      expect {
        simulate_stdin('4', '4', '+3', '*', '+1', '=', 'q') do
          described_class.new(silent_mode: true).call
        end
      }.to output("443.0\n").to_stdout
    end
  end

  describe 'wrong user entries' do
    it 'should return an error message containing `Unknown command`.' do
      expect {
        simulate_stdin('x3', 'q') do
          described_class.new(silent_mode: true).call
        end
      }.to output("Unknown command: 'x3'\n0.0\n").to_stdout

      expect {
        simulate_stdin('44-3', 'q') do
          described_class.new(silent_mode: true).call
        end
      }.to output("Unknown command: '44-3'\n0.0\n").to_stdout

      expect {
        simulate_stdin('44++3', 'q') do
          described_class.new(silent_mode: true).call
        end
      }.to output("Unknown command: '44++3'\n0.0\n").to_stdout
    end

    it 'should return an error message containing `Wrong numeric format!`.' do
      expect {
        simulate_stdin('4', '4', '-3', 'q') do
          described_class.new(silent_mode: true).call
        end
      }.to output("Wrong numeric format!\n0.0\n").to_stdout
    end
  end
end
