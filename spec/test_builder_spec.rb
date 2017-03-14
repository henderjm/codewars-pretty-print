require 'spec_helper'
require_relative '../lib/test_builder'

RSpec.describe 'test_builder' do
  let(:mock_results) { mock_test_result }
  let(:builder) { TestBuilder.new(mock_results) }

  context 'when results exist' do
    it 'should access elements as hash' do
      expect(builder.html).to_not be_nil
    end
  end

  context 'when no results exist' do
    let(:mock_results) { nil }

    it 'should render page with no results' do
      expect(builder.html).to be_empty
    end
  end

  describe 'building html' do
    context 'when all pass exist' do
      context 'when no nested #describes exists' do
        it 'should print first line of results with describe' do
          complete_html = builder.html[0].join("\n")
          expect(complete_html).to eq("<br>\n<div class=\"description-level\">\n<h3>Basic tests</h3>\n</div>")
        end

        it 'should count all #it tests' do
          expect(builder.passed_tests).to eq(3)
        end

        it 'should count all #failed tests' do
          expect(builder.failed_tests).to eq(7)
        end

        it 'should have 11 blocks in the results html array' do
          expect(builder.html.size).to eq(11)
        end

        it 'should print a #passed test in a div' do
          complete_html = builder.html[1].join("\n")
          expect(complete_html).to eq("<br>\n<div class=\"passed_it\">\n<h3>Passed: </h3> Test Passed: Value == 3\n</div>")
        end
      end
    end
  end
end
