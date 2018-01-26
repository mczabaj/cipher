# International Espionage

The Foobarnian Ministry of Information has found a way to intercept telegrams being sent from headquarters to field agents by their arch-nemeses, the Barfoonians. At first, they were very disappointed to find they could not read the messages because they contained a bunch of "gibberish". So they forwarded the texts to the Ministry of Obsolete Cryptography, who looked them over and after several all-nighters fueled by Foobarnian jelly beans, deduced that they were encoded with a combination of 2 basic and ancient ciphers. Any one of these ciphers would have been trivial to break, but the Barfoonians apparently believed that by combining the results, they'd become a lot more secure. They were right, but it was no still match for Foobarnian jelly beans. Their loss.

### The Barfoonian's Ultra-secure Crypto, deconstructed

The plaintext could include any uppercase letter of the alphabet and digits 0-9.

The encryption method was done by running the plaintext through the following techniques in succession:

  * a [Caesar/Mixed Alphabet Cipher](http://crypto.interactive-maths.com/mixed-alphabet-cipher.html) : in a simple Caesar substitution cipher (sometimes known as ROT-13), the substitution string is simply formed by starting the alphabet at an pre-shared offset and looping around. You can also provide a keyword to provide a way of mixing up the substitution string a bit, so their are not merely 36 possible substitution strings. You can also do both! This is what the Barfoonians did. 
 
  So if the keyword was GREYHOUND and the offset was 17, you put the keyword first, move it right by the given offset, then go through all the remaining alphabet in order, without repeating any letters. So your substitution text would look like:

          A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|0|1|2|3|4|5|6|7|8|9
          Q|S|T|V|W|X|Z|0|1|2|3|4|5|6|7|8|9|G|R|E|Y|H|O|U|N|D|A|B|C|F|I|J|K|L|M|P

  Note how the letters for GREYHOUND are offset 17 places from the left, and the remaining letters of the alphabet all follow in order.

  Thus the plaintext "ALL YOUR BASE" would become "Q44 N7YG SQRW".

  Of course, this method is trivially subject to [frequency analysis](https://en.wikipedia.org/wiki/Frequency_analysis). So the Barfoonians took the ciphertext resulting from this and ran it through:

  * [Columnar Transposition Cipher (Square Code)](http://crypto.interactive-maths.com/columnar-transposition-cipher.html)<sup>1</sup>: this method has the nice advantage of transposing the text in a way that confuses usual frequency analysis, so the Barfoonians belived the combination would be quite secure. This also used the same keyword as the first step. To encrypt the text "MANY SHIPS MOVING TOWARD YOUR LOCATION" with the keyword "FOXHOUND", you use this procedure:
    1. write the letters of the keyword in *alphabetical order*, discarding any duplicates (DFHNOUX)
    2. write out the plaintext, without spaces or punctuation, in rows that wrap to fit below the ordered keyword. Add X's to take up any leftover spaces. eg:

        ```
        DFHNOUX
        .......
        MANYSHI
        PSMOVIN
        GTOWARD
        YOURLOC
        ATIONXX
        ```

    3. read the letters down in each column, *using the keyword's original order*. So in this case the ciphertext would be "ASTOTSVALNINDCXNMOUIHIROXYOWROMPGYA".

The Barfoonians used the output of their Caesar Cipher as the input to their Columnar Transposition Cipher, and then confidently sent their messages over the telegraph wires. The same keyword was used for both steps.

They also thought they were clever in using a different keyword each day. This stumped the Foobarnians for a bit until they realized that the keyword was always taken from the first word over 6 letters long from the headlines on the front page of the Barfoonian Times. Furthermore, the numeric offset for the Caesar Cipher was always today's date.

### Your task, should you choose to accept it

The Foobarnians have been celebrating this total p0wnage over their rivals a bit too much, and their heads hurt from manually decrypting all the intecepted messages. So they have asked you to make their victory complete by writing a script to make it easy for them to decrypt these messages, given the encrypted text, the keyword, and today's date. So it's now very easy to get the keyword and offset.

Here are are the latest messages they have received over the last few days - the first one was already decrypted manually, for reference:

      1T7766T56C6ZXB71T7NIXC6I5XMXIY11CWX8I5V7AE CEILING 17 ("IMPORTANT INFORMATION COMING OVER NEXT 4 DAYS")
      SXTW7P6WWW0EZXOZWQ560W3IEPWWE05O0V69ZZ9EYXZW9WPP703AZ339PVWEZ57SAEW00XEXWW7B5PP6S3EX SERIOUS 18
      5M49RZUVOPZXSYRY2M53MZ6XY95ZVVV5Y89X MOONSHOT 19
      Q8TUTRQU7QB0493X8UVDYQ8X93BQ379X59919YUX5U37UQD8 BODEGA 20
      L8W6LXTTV30E07T73849WT18LLW8UT86XUU6 POKEMON 21

### Implementation

Feel free to implement the decryptor in the language of your choice (but would have to point out that ruby has some Array and String methods that would come in very handy...). As always, tests would be essential, and instructions on how to run the script would be useful.

### Further thought

Once this is done, the Foobarnians might ask about ways they could safely exchange messages with their field agents without making the same mistakes. What would you tell them?

##### Footnote

1. Note the method described at the link is a bit different, in that duplicate letters are not removed from the keyword. It makes programming significantly easier to just mutate the keyword to contain only unique letters, as described here.
