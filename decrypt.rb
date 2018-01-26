require_relative "caesar"
require_relative "column_transpo"

class Decrypt

  def initialize(arg_list)
    if arg_list.count == 3
      @cipher = arg_list[0].upcase
      @keyword = arg_list[1].upcase
      @offset = arg_list[2].to_i
    else
      raise ArgumentError.new("Please pass a cipher, keyword, and an integer offset as parameters, respectively.")
    end
  end

  def show_me_the_input()
    "Here's the goods: #{@cipher} #{@keyword} #{@offset}"
  end

  def decrypt_it()
    # CT = Columnar Transposition
    ct_cipher = ColumnTranspo.new(@keyword)
    ct_phrase = ct_cipher.decrypt_str(@cipher)

    caesar_cipher = Caesar.new(@keyword, @offset)
    phrase = caesar_cipher.decrypt_str(ct_phrase)

    puts "Here is your decrypted phrase:"
    puts phrase
    phrase
  end
end

begin
  decryptor = Decrypt.new(ARGV)

  puts decryptor.show_me_the_input
  puts decryptor.decrypt_it

rescue Exception => e
  puts e.message
end
