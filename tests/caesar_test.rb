require_relative "../caesar"
require "test/unit"

class TestCaesar < Test::Unit::TestCase

  def setup
    @caesar = Caesar.new("GREYHOUND", 17)
  end

  def teardown
    ## Nothing really
  end

  def test_new_alphabet
    assert_equal(["Q", "S", "T", "V", "W", "X", "Z", "0", "1", "2", "3", "4",
                  "5", "6", "7", "8", "9", "G", "R", "E", "Y", "H", "O", "U",
                  "N", "D", "A", "B", "C", "F", "I", "J", "K", "L", "M", "P"],
                 @caesar.get_new_alphabet)
  end

  def test_keyed_alphabet
    assert_equal({"A"=>"Q", "B"=>"S", "C"=>"T", "D"=>"V", "E"=>"W", "F"=>"X",
                  "G"=>"Z", "H"=>"0", "I"=>"1", "J"=>"2", "K"=>"3", "L"=>"4",
                  "M"=>"5", "N"=>"6", "O"=>"7", "P"=>"8", "Q"=>"9", "R"=>"G",
                  "S"=>"R", "T"=>"E", "U"=>"Y", "V"=>"H", "W"=>"O", "X"=>"U",
                  "Y"=>"N", "Z"=>"D", "0"=>"A", "1"=>"B", "2"=>"C", "3"=>"F",
                  "4"=>"I", "5"=>"J", "6"=>"K", "7"=>"L", "8"=>"M", "9"=>"P"},
                 @caesar.lookup_hash)
  end

  def test_encrypt_char
    assert_equal("K", @caesar.encrypt_char("6"))
  end

  def test_decrypt_char
    assert_equal("N", @caesar.decrypt_char("6"))
  end

  def test_encrypt_str
    assert_equal("Q44N7YGSQRW", @caesar.encrypt_str("ALLYOURBASE"))
  end

  def test_decrypt_str
    assert_equal("ALLYOURBASE", @caesar.decrypt_str("Q44N7YGSQRW"))
  end

end
