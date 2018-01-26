require_relative "caesar"
require_relative "column_transpo"

class Encrypt

  def initialize(arg_list)
    if arg_list.count == 3
      @phrase = arg_list[0].upcase.delete(" ")
      @keyword = arg_list[1].upcase
      @offset = arg_list[2].to_i
    else
      raise ArgumentError.new("Please pass a phrase, keyword, and an integer offset as parameters, respectively.")
    end
  end

  def show_me_the_input
    "Here's the goods: #{@phrase} #{@keyword} #{@offset}"
  end

  def encrypt_it
    caesar_cipher = Caesar.new(@keyword, @offset)
    caesar_phrase = caesar_cipher.encrypt_str(@phrase)

    puts "caesar cipher: #{caesar_phrase}"

    # CT = Columnar Transposition
    ct_cipher = ColumnTranspo.new(@keyword)
    ct_phrase = ct_cipher.encrypt_str(caesar_phrase)

    puts "Here is your encrypted phrase:"
    ct_phrase
  end

end

begin
  encryptor = Encrypt.new(ARGV)

  puts encryptor.show_me_the_input
  puts encryptor.encrypt_it

rescue Exception => e
  puts e.message
end
