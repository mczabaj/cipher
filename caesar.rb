class Caesar
  @@base_alpha = ["A","B","C","D","E","F","G","H","I","J","K","L","M",
                  "N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
                  "0","1","2","3","4","5","6","7","8","9"]

  def initialize(keyword, offset)
    @caesar_keyed_alphabet = Hash[@@base_alpha.zip(new_alphabet(keyword, offset.to_i))]
  end

  def get_new_alphabet()
    @caesar_keyed_alphabet.values
  end

  def lookup_hash()
    @caesar_keyed_alphabet
  end

  def encrypt_char(char)
    @caesar_keyed_alphabet[char]
  end

  def decrypt_char(char)
    @caesar_keyed_alphabet.key(char)
  end

  def encrypt_str(str)
    str.split("").map{ |c| encrypt_char(c) }.join
  end

  def decrypt_str(str)
    str.split("").map{ |c| decrypt_char(c) }.join
  end

  private

  def new_alphabet(keyword, offset)
    new_alpha = keyword.split("").uniq

    @@base_alpha.each do |letter|
      unless new_alpha.include?(letter)
        new_alpha.push(letter)
      end
    end

    new_alpha.rotate(-offset)

  end

end
