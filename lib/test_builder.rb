
class TestBuilder

  attr_reader :html, :passed_tests, :failed_tests

  def initialize(output)
    @html = []
    @passed_tests = 0
    @failed_tests = 0
    to_html(output)
  end

  private

  def to_html(output)
    if output.nil?
      'No test results to show'
    else
      output.split("<:LF:>").each do |value|
        tag = value.split("::>")
        message = tag[1]
        x = if tag[0].start_with?("<DESCRIBE")
              write_desribe(message)
            elsif tag[0].start_with?("<PASSED")
              @passed_tests += 1
              write_it(:passed_it, message)
            elsif tag[0].start_with?("<FAILED")
              @failed_tests += 1
              write_it(:failed_it, message)
            else
              ''
            end
      end
    end
  end

  def write_it(symbol, message)
    block = []
    block << "<br>"
    block << "<div class=\"#{symbol}\">"
    block << "<h3>Passed: </h3> #{message}"
    block << '</div>'
    @html << block
  end

  def write_desribe(message)
    block = []
    block << "<br>"
    block << '<div class="description-level">'
    block << "<h3>#{message}</h3>"
    block << '</div>'
    @html << block
  end
end
