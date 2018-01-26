require_relative "../column_transpo"
require "test/unit"

class TestColumnTranspo < Test::Unit::TestCase

  def setup
    @ct = ColumnTranspo.new("FOXHOUND")
  end

  def teardown
    ## Nothing really
  end

## Encrypt Tests

  def test_encrypt_str
    assert_equal("ASTOTSVALNINDCXNMOUIHIROXYOWROMPGYA", @ct.encrypt_str("MANY SHIPS MOVING TOWARD YOUR LOCATION"))
  end

  def test_fill_out_phrase_eq
    assert_equal("ABCDEFGH", @ct.fill_out_phrase("ABCDEFGH", 4))
  end

  def test_fill_out_phrase_lt
    assert_equal("ABCDEFXX", @ct.fill_out_phrase("ABCDEF", 4))
    assert_equal("MANYSHIPSMOVINGTOWARDYOURLOCATIONXX", @ct.fill_out_phrase("MANYSHIPSMOVINGTOWARDYOURLOCATION", 7))
    assert_equal("MANYSHIPSMOVINGTOWARDYOURLOCATIONXX", @ct.fill_out_phrase("MANY SHIPS MOVING TOWARD YOUR LOCATION", 7))
  end

  def test_create_box_no_pad
    assert_equal([["A","B","C","D"],["E","F","G","H"]], @ct.create_box("ABCDEFGH", 4))
  end

  def test_create_box_pad
    assert_equal([["A","B","C","D"],["E","F","X","X"]], @ct.create_box("ABCDEFXX", 4))
    assert_equal([["M", "A", "N", "Y", "S", "H", "I"],
                  ["P", "S", "M", "O", "V", "I", "N"],
                  ["G", "T", "O", "W", "A", "R", "D"],
                  ["Y", "O", "U", "R", "L", "O", "C"],
                  ["A", "T", "I", "O", "N", "X", "X"]], @ct.create_box("MANYSHIPSMOVINGTOWARDYOURLOCATIONXX", 7))
  end

  def test_write_order
    assert_equal([1, 4, 6, 2, 5, 3, 0], @ct.write_order)
  end

  def test_turn_box_to_cipher
    assert_equal("ASTOTSVALNINDCXNMOUIHIROXYOWROMPGYA",
                 @ct.turn_box_to_cipher([["M", "A", "N", "Y", "S", "H", "I"],
                                         ["P", "S", "M", "O", "V", "I", "N"],
                                         ["G", "T", "O", "W", "A", "R", "D"],
                                         ["Y", "O", "U", "R", "L", "O", "C"],
                                         ["A", "T", "I", "O", "N", "X", "X"]]))
  end

## Decrypt Tests

  def test_read_order
    assert_equal([6, 0, 3, 5, 1, 4, 2], @ct.read_order)
  end

  def test_decrypt_str
    assert_equal("MANYSHIPSMOVINGTOWARDYOURLOCATIONXX", @ct.decrypt_str("ASTOTSVALNINDCXNMOUIHIROXYOWROMPGYA"))
  end

  def test_cipher_to_box
    assert_equal([["A", "S", "T", "O", "T"],
                  ["S", "V", "A", "L", "N"],
                  ["I", "N", "D", "C", "X"],
                  ["N", "M", "O", "U", "I"],
                  ["H", "I", "R", "O", "X"],
                  ["Y", "O", "W", "R", "O"],
                  ["M", "P", "G", "Y", "A"]],
                 @ct.cipher_to_box("ASTOTSVALNINDCXNMOUIHIROXYOWROMPGYA", 7))
  end

  def test_turn_box_to_phrase
    assert_equal("MANYSHIPSMOVINGTOWARDYOURLOCATIONXX",
                 @ct.turn_box_to_phrase([["A", "S", "T", "O", "T"],
                                         ["S", "V", "A", "L", "N"],
                                         ["I", "N", "D", "C", "X"],
                                         ["N", "M", "O", "U", "I"],
                                         ["H", "I", "R", "O", "X"],
                                         ["Y", "O", "W", "R", "O"],
                                         ["M", "P", "G", "Y", "A"]]))
  end

end
