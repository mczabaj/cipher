class ColumnTranspo

  def initialize(keyword)
    @keyword = keyword
  end

  def encrypt_str(phrase)
    return nil if phrase.nil? || phrase.empty?

    kw = @keyword.split("").uniq.sort
    puts "keyword sorted, dups removed: #{kw.inspect}"

    full_phrase = fill_out_phrase(phrase, kw.count)
    puts "full phrase without spaces, with padded X's: #{full_phrase}"

    box = create_box(full_phrase, kw.count)
    puts "the box: #{box.inspect}"

    turn_box_to_cipher(box)

  end

  def decrypt_str(cipher)
    kw = @keyword.split("").uniq.sort

    box = cipher_to_box(cipher, kw.count)

    turn_box_to_phrase(box)

  end


  def fill_out_phrase(phrase, kw_count)
    phrase = phrase.match(/\s/) ? phrase.delete(" ") : phrase
    missing = phrase.split("").count % kw_count
    if missing == 0
      phrase
    else
      (kw_count - missing).times{|i| phrase << "X"}
      phrase
    end
  end

  def create_box(phrase, kw_count)
    box = []
    row = []
    idx = 0

    phrase.split("").each do |l|
      if idx < kw_count
        row.push(l)
        idx += 1
      else
        box.push(row)
        row = []
        row.push(l)
        idx = 1
      end
    end

    box.push(row)
  end

  def write_order
    sorted_kw = @keyword.split("").uniq.sort
    @keyword.split("").uniq.map{|l| sorted_kw.index(l)}
  end

  def read_order
    kw = @keyword.split("").uniq
    kw.sort.map{|l| kw.index(l)}
  end

  def turn_box_to_cipher(box)
    text = []
    write_order.each do |column|
      box.each do |row|
        text.push(row[column])
      end
    end
    text.join
  end

  def cipher_to_box(cipher, kw_count)
    cipher_a = cipher.split("")
    row_count = cipher_a.count / kw_count
    box = []
    kw_count.times do |i|
      box[i] = cipher_a.shift(row_count)
    end
    box
  end

  def turn_box_to_phrase(box)
    text = []
    box[0].count.times do |col_idx|
      read_order.each do |row_idx|
        text.push(box[row_idx][col_idx])
      end
    end
    text.join
  end

end

#TODO see below

## note to self, mention in readme to not pass punctuation (because i didnt
##   add any code to capture and remove non alpha-numeric characters)

## Also... write a readme to how to use this application! lol
