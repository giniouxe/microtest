require './microtest'

# Some test examples
class ExampleTests < Microtest

  def first_test
    test '0.002 equals 0.001' do
    assert_in_delta(0.001, 0.002)
    end
  end

  def second_test
    test '1 is in primary numbers' do
      assert_includes [1, 3, 5, 7], 1
    end
  end

  def third_test
    test 'empty string is really empty' do
      assert_empty ''
    end
  end

  def fourth_test
    test 'string with whitespaces is not so empty' do
      assert_empty ' '
    end
  end
end
