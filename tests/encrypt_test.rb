require_relative "../encrypt"
require "test/unit"

class TestDecrypt < Test::Unit::TestCase

  def setup
    @encryptor = Encrypt.new(["HELLO WORLD HOW ARE YOU",
                              "CEILING",
                              "17"])
  end

  def teardown
    ## Nothing really
  end

  def test_initalize_pass
    assert_not_nil(Encrypt.new(["a","b","1"]))
  end

  def test_initalize_fail
    assert_raise( ArgumentError) {
      Encrypt.new(["1"])
    }
  end

  def test_show_me_the_input
    assert_equal("Here's the goods: HELLOWORLDHOWAREYOU CEILING 17", @encryptor.show_me_the_input )
  end

  def test_encrypt_it
    assert_equal("07GLXCTX4WXX70BXG77X44CX", @encryptor.encrypt_it)
  end

end
