# Implementation of test run and assertions
class Microtest
  TESTS = []

  def self.inherited(klass)
    TESTS << klass
  end

  def self.run_all_tests
    TESTS.each(&:run)
  end

  def self.run
    public_instance_methods.grep(/_test$/).each do |name|
      new.run name
    end
  end

  def run(name)
    send name
  end

  # Assertions
  def assert(test, message = 'Failure')
    if test
      puts 'Success!'
      return
    end
    fail RuntimeError, message, caller
  end

  def assert_equal(expected, actual)
    assert expected == actual, "Failed! assert_equal: #{expected} vs. #{actual}."
  end

  def assert_in_delta(expected, actual)
    delta = (expected - actual).abs
    assert delta <= 0.001, "Failed! assert_in_delta: #{expected} vs. #{actual}."
  end

  def assert_includes(collection, actual)
    assert collection.include?(actual),
           "Failed! assert_includes: #{actual} in #{collection}."
  end

  def assert_empty(object)
    assert object.empty?, "Failed! assert_empty: #{object}."
  end

  def test(description = '')
    puts "#{description}:"
    yield
  end
end
