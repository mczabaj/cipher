require_relative "../decrypt"
require "test/unit"

class TestDecrypt < Test::Unit::TestCase

  def setup
    @decryptor = Decrypt.new(["1T7766T56C6ZXB71T7NIXC6I5XMXIY11CWX8I5V7AE",
                              "CEILING",
                              "17"])
  end

  def teardown
    ## Nothing really
  end

  def test_initalize_pass
    assert_not_nil(Decrypt.new(["a","b","1"]))
  end

  def test_initalize_fail
    assert_raise( ArgumentError) {
      Decrypt.new(["1"])
    }
  end

  def test_show_me_the_input
    assert_equal("Here's the goods: 1T7766T56C6ZXB71T7NIXC6I5XMXIY11CWX8I5V7AE CEILING 17", @decryptor.show_me_the_input )
  end

  def test_decrypt_it
    assert_equal("IMPORTANTINFORMATIONCOMINGOVERNEXT4DAYSEEE", @decryptor.decrypt_it)
  end

end
