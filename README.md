# Cipher Challenge

Given a string, along with a keyword and an offset, decode the message in the string.

## How To:

* CD to the cipher folder (root).
* Run:

    `ruby decrypt.rb "<your cipher>" "KEYWORD" <offset integer>`
    
* The results should be shown in the terminal

Additionally, you can Encrypt a message using the following:

    `ruby encrypt.rb "<your message>" "KEYWORD" <offset integer>`

## Try These:
    1T7766T56C6ZXB71T7NIXC6I5XMXIY11CWX8I5V7AE CEILING 17 ("IMPORTANT INFORMATION COMING OVER NEXT 4 DAYS")
    SXTW7P6WWW0EZXOZWQ560W3IEPWWE05O0V69ZZ9EYXZW9WPP703AZ339PVWEZ57SAEW00XEXWW7B5PP6S3EX SERIOUS 18
    5M49RZUVOPZXSYRY2M53MZ6XY95ZVVV5Y89X MOONSHOT 19
    Q8TUTRQU7QB0493X8UVDYQ8X93BQ379X59919YUX5U37UQD8 BODEGA 20
    L8W6LXTTV30E07T73849WT18LLW8UT86XUU6 POKEMON 21

## Testing:

Tests for various script files can be found in the `Tests` folder.

They can be executing similarly to the encrypt and decrypt scripts above, but without any parameters.

    `ruby decrypt_test.rb`
