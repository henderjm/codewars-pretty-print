RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end

def mock_test_result
  "<DESCRIBE::>Basic tests<:LF:><PASSED::>Test Passed: Value == 3<:LF:><FAILED::>Expected: 1, instead got: 3<:LF:><FAILED::>Expected: 4, instead got: 3<:LF:><FAILED::>Expected: 2, instead got: 3<:LF:><PASSED::>Test Passed: Value == 3<:LF:><FAILED::>Expected: 2, instead got: 3<:LF:><FAILED::>Expected: 26, instead got: 3<:LF:><FAILED::>Expected: 48, instead got: 3<:LF:><PASSED::>Test Passed:Value == 3<:LF:><FAILED::>Expected: 32, instead got: 3<:LF:><COMPLETEDIN::>"
end
