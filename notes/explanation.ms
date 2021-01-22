.TL
Code Bytes Daily Challenge Explanation (Python)
.AU
Robertus Diawan Chris
.NH
.XN "Day 1 - Reverse String"
.LP
The challenge for day one is reverse string from an input.

.PP
On this challenge i use slice string to reverse string (to print the string text backward).
Slice string have this syntax
.CW "[start:stop:step]"
and giving no value as start and stop indicates default to 0 as start and string length as stop, and also if we assign step to "-1" denotes starting from the very end.
.PP
So for this challenge the main code is
.CW "string[::-1]".
I solve this challenge using external file as an input, the code is below:
.IP
.CW
from fire import Fire

def main(file_input):
    with open(file_input) as f:
        string = f.read().splitlines()

        for s in string:
            print(s[::-1])

if __name__ == '__main__':
    Fire(main)
.LP
here's inside input file:
.IP
.TS
l.
Cat
The Daily Byte
civic
.TE
.LP
and using read().splitlines() method we can read each sentence in different lines.
.NH
.XN "Day 2 - Valid Palindrome"
.LP
The challenge for day two is palindrome case.
It's basically check if a sentence read the same forward and backward.

.PP
For this challenge i solve it by comparing the actual string and the reverse string version, if it's the same then it's polindrome. I turn all the string into lowercase and remove all symbols before comparing actual string and reverse string. Here is the code:
.IP
.CW
from fire import Fire

def main(input):
    input_without_symbols = input.replace(',', '').replace(':', '').replace(' ', '').replace('.', '')

    print(f'{input} -> true') if input_without_symbols.lower() == input_without_symbols.lower()[::-1] else print(f'{input} -> false')

if __name__ == '__main__':
    Fire(main)
.LP
I use fire python module to give an input in command line interface, you could give the list directly inside the code if you want. I'm still learning about regular expression so i'm not sure how to implement regex in this case for now.
.NH
.XN "Day 3 - Vacuum Cleaner Route"
.LP
The challenge for day three is how to determine if a robot vacuum cleaner return to the original position.
.IP
.TS
tab(,);
ccl.
U,->,Up
D,->,Down
L,->,Left
R,->,Right
.TE

.PP
So first thing first we need to know that to back to original position we need to define the variable of the moves and the oposite of the move, for example, the oposite of up is down so if the robot going up then the we're gonna add the value of up-down variable and if the robot going down then we're gonna minus the value of up-down variable so if the robot back to original position then the value of up-down varible should be 0. With that in mind, here's the code:
.IP
.CW
from fire import Fire

def main(moves):
    UD = 0 #up and down variable
    LR = 0 #left and right variable

    for m in moves:
        if m == 'U':
            UD += 1
        elif m == 'D':
            UD -= 1
        elif m == 'L':
            LR += 1
        elif m == 'R':
            LR -= 1

    print(UD == 0 and LR == 0)

if __name__ == '__main__':
    Fire(main)
.bp
.NH
.XN "Day 4 - Correct Capitalization"
.LP
Given a string, return whether or not it uses capitalization correctly. A string correctly uses capitalization if all letters are capitalized, no letters are capitalized, or only the first letter is capitalized.
.LP
Example:
.IP
.TS
tab(,);
ccc.
"USA",return,True
"Nganu",return,True
"compUter",return,False
"coding",return,True
.TE

.PP
To solve that challenge i use python built-in string methods that is
.CW "string.isupper()"
to check if all the letter is uppercase and
.CW "string.islower()"
to check if all the letter is lowercase and for only the first letter is capitalized i compare the result of python built-in string methods that is
.CW "string.capitalize()"
with the actual word.
.LP
With that in mind, here's the code:
.IP
.CW
from fire import Fire

def main(word):
    print(word.isupper() or word.islower() or word == word.capitalize())

if __name__ == '__main__':
    Fire(main)
.NH
.XN "Day 5 - Add Binary"
.LP
Given two binary strings (strings containing only 0s and 1s) and then return their sum as a binary strings too. Note: neither binary string will start with 0s unless the string itself is 0.
.LP
Example:
.IP
.TS
tab(,);
ccccc.
"100",+,"1",return,"101"
"11",+,"1",return,"100"
"1",+,"0",return,"1"
.TE

.PP
To solve that challenge i use python built-in
.CW "bin()"
and
.CW "int()"
function.
.CW "bin()"
function convert integer number to a binary string prefixed with "0b" and
.CW "int()"
function return integer object constructed from a number or string given numeric base.
.PP
There're two ways you can use
.CW "int()"
function. That is, using the function with number or with string. Here's the general syntax:
.IP
.CW
.TS
ll.
int(x)
int(x, base)
.TE
.LP
here's the example:
.CW "int(10)"
or
.CW "int('10', 2)".
Here's a brief explanation about
.B "base"
in
.CW "int()"
function:
.IP
Base 1 only have "0" as a symbol so the lowest base is 2, while base 0 return the string number as it is. Base 2 uses symbols "01". For example, if we do
.CW "print('11', 0)"
then the result gonna be 11, the actual number. But if we do
.CW "print('11', 2)"
then the result gonna be 3, the number from the binary string '11'. So if you do
.CW "print(bin(3))"
then you're gonna get "0b11" which "0b" is the binary indicator (to make it simpler) and 11 is the actual binary.
.IP
While the highest base is 36 because it use symbols from "0123456789abcdefghijklmnopqrstuvwxyz" (10 digits + 26 characters, and you could continue with more symbols too).
.LP
Below is the table to make it easier to understand:
.TS
center allbox tab(,);
cs
cc.
Base
0, Print number as it is
2, The lowest base (use "01" symbols)
36, The highest base (use "0123456789abcdefghijklmnopqrstuvwxyz" symbols)
.TE
.LP
Here's the example for manually calculate using base:
.IP
.CW "int('11', 2)"
-> 1*(2**1) + 1*(2**0)
.LP
here's another example using base-10:
.IP
.CW "int('11', 10)"
-> 1*(10**1) + 1*(10**0)
.LP
With that in mind, here's the code:
.IP
.CW
from fire import Fire

def main(string1, string2):
    a = str(string1)
    b = str(string2)
    s = bin(int(a, 2) + int(b, 2))
    print(s[2::])

if __name__ == '__main__':
    Fire(main)
.LP
I convert the input to string because fire python module automatically convert the python object even though i use "" to declare as string and it still recognized as integer. For s[2::] means that it start from second part (so 0 and 1 doesn't shown), if i didn't do that then the result gonna be 0b100 which 100 is the binary of the result and we didn't really need 0b.
.NH
.XN "Day 6 - Longest Common Prefix"
.LP
Given an array of strings, return the longest common prefix that is shared amongst all strings. Note: you may assume all strings only contain lowercase alphabetical characters.
.LP
Example:
.IP
.TS
tab(|);
lcl.
["colorado", "color", "cold"]|return|"col"
["a", "b", "c"]|return|""
["spot", "spotty", "spotted"]|return|"spot"
.TE

.PP
To solve that problem i search for the shortest length from all input string.
.LP
For example:
.IP
from input ["colorado", "color", "cold"], the shortest length from all the input string is "cold" with only 4 characters.
.LP
From there i compare all the characters from all the input string with the character from the shortest string. I do this to avoid index out of bounds error and also if shortest string doesn't have any character left then the common prefix gonna end anyway.
.bp
.PP
There are two conditional, that is if the input only contain 1 character like ['a', 'a', 'a'] or not and if that's not the case then i'm gonna ignore the shortest word because i'm gonna compare the other word with the shortest word so i don't need to compare the same word. With that in mind, here's the code:
.IP
.CW
from fire import Fire

def main(file_input):
    with open(file_input) as f:
        collections = f.read().splitlines()

        compare_len = [len(collections[i]) for i in range(len(collections))]
        min_len = min(compare_len)

        min_list = [s for s in collections if len(s) == min_len]
        min_word = "".join(min_list[0])

        for word in collections:
            if len(min_list) > 1 and min_len == 1 and word == min_word:
                result = "".join([char for char in min_word if char in word])
            elif word == min_word:
                pass
            else:
                result = "".join([char for char in min_word if char in word])

        print(result)

if __name__ == '__main__':
    Fire(main)
.LP
How it works is basically if there's a character from the shortest word on other word then add to the list. The "".join([char for char in min_word if char in word]) is basically to make the result as a string and not a list.
.TC
