.TL
My Daily Bytes (by Kevin Naughton Jr) Solution (Python)
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

    print(input_without_symbols.lower() == input_without_symbols.lower()[::-1])

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
.LP
Example:
.IP
.TS
tab(,);
lcc.
"LR",return,True
"URURD",return,False
"RUULLDRD",return,True
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
lcc.
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
    print(s[2:])

if __name__ == '__main__':
    Fire(main)
.LP
I convert the input to string because fire python module automatically convert the python object even though i use "" to declare as string and it still recognized as integer. For s[2:] means that it start from second part (so 0 and 1 doesn't shown), if i didn't do that then the result gonna be 0b100 which 100 is the binary of the result and we didn't really need 0b.
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
.NH
.XN "Day 7 - Valid Palindrome with Removal"
.LP
Given a string and the ability to delete at most one character, return whether or not it can form a palindrome (read the same forward and backward).
.LP
Example:
.IP
.TS
tab(,);
lcc.
"abcba",return,True
"foobof",return,True
"abccab",return,False
.TE

.PP
The first thing i do is checking if it's a normal palindrome or not, if it's palindrome then print the result immediately and if it's not then remove one character or alphabet and check if it's palindrome or not while print out the result of all possibilities, for example, from "foobof" we can get a polindrome from "fobof" if we remove the first or second "o" or we can get a polindrome from "fooof" if we remove the character "b".
.bp
.LP
With that in mind, here's the code:
.IP
.CW
from fire import Fire

def main(string):
    if string == string[::-1]:
        print(string == string[::-1])

    else:
        palindrome = ''
        for i in range(len(string)):
            new_string = string[:i] + string[i+1:]
            if new_string == new_string[::-1]:
                print(f'{new_string} -> {new_string == new_string[::-1]}')
                palindrome = new_string == new_string[::-1]
            else:
                not_palindrome = new_string == new_string[::-1]

        print(palindrome) if palindrome != '' else print(not_palindrome)

if __name__ == '__main__':
    Fire(main)
.NH
.XN "Day 8 - Two Sum"
.LP
Given an array of integers, return, whether or not two numbers sum to a given target 'k'. Note: you may not sum a number with itself.
.LP
Example:
.IP
.TS
tab(|);
llcc.
[1, 3, 8, 2]|k = 10|return|True
[3, 9, 13, 7]|k = 8|return|False
[4, 2, 5, 2]|k = 4|return|True
.TE

.PP
I use external file as an input and then use the content from that file as an array input. I use two looping, the first is looping through all the array content and then split current content from the rest. After that, on second loop is for sum the current content with the rest of the array content and check if the result is the same as the target or not. With that in mind, here's the code:
.IP
.CW
from fire import Fire

def main(file_input, target):
    with open(file_input) as f:
        num_array = f.read().splitlines()

        true_sum = ''
        for i in range(len(num_array)):
            num = int(num_array[i])
            plus_array = num_array[:i] + num_array[i+1:]

            for j in plus_array:
                j = int(j)

                if num + j == target:
                    true_sum = num + j == target
                else:
                    false_sum = num + j == target

        print(true_sum) if true_sum != '' else print(false_sum)

if __name__ == '__main__':
    Fire(main)
.NH
.XN "Day 9 - Jewels and Stones"
.LP
Given a string representing your stones and another string representing a list of jewels, return the number of stones that you have that are also jewels.
.LP
Example:
.IP
.TS
tab(,);
llcc.
jewels="abc",stones="ac",return,2
jewels="Af",stones="AaaddfFf",return,3
jewels="AYOPD",stones="ayopd",return,0
.TE

.PP
For this challenge i use list comprehension and then print the length of the list. The logic is like this, if any string in stones also in string jewels then put that string into list (like example above). With that in mind, here's the code:
.IP
.CW
from fire import Fire

def main(jewels, stones):
    similar = [j for j in stones if j in jewels]
    print(f'Stones that are also jewels: {len(similar)}')

if __name__ == '__main__':
    Fire(main)
.NH
.XN "Day 10 - Valid Anagram"
.LP
Given two strings
.CW "s"
and
.CW "t",
return whether or not
.CW "s"
is anagram of
.CW "t".
Note: An anagram is a word formed by reordering the letters of another word.
.LP
Example:
.IP
.TS
tab(,);
llcc.
s="cat",t="tac",return,True
s="listen",t="silent",return,True
s="program",t="function",return,False
.TE

.PP
For this challenge i use list comprehension to check is there similar alphabet from string one in string two, if there's then add that alphabet into the list. After that, check the length of the result list with the length of one of the string (i assumed because it's reordering then it's gonna have the same length) and then print the comparison result. With that in mind, here's the code:
.IP
.CW
from fire import Fire

def main(string1, string2):
    anagram = [s1 for s1 in string1 if s1 in string2]
    print(len(anagram) == len(string1))

if __name__ == '__main__':
    Fire(main)
.NH
.XN "Day 11 - First Unique Character"
.LP
Given a string, return the index of its first unique character. If a unique character does not exist, return -1
.LP
Example:
.IP
.TS
tab(,);
lcc.
"abcabd",return,2
"thedailybyte",return,1
"developer",return,0
"anuuna",return,-1
.TE

.PP
For this challenge i make new string without the current alphabet. For example, if i want to check the first 'a' from 'abcabd' then i'm gonna make new string containing 'bcabd' and if i want to check 'c' from 'abcabd' then i'm gonna make new string containing 'ababd'.
.PP
The new string contains the alphabet before and after the current string, that's because if i only check the alphabet after the current string, there's a possibilities that the alphabet appear before the current string. For example, if i want to check the first 'u' from 'anuuna' with only the alphabet after the current string then it's not gonna return the index because there's a second 'u' after the first 'u', but if i want to check the second 'u' then it's gonna return the index of second 'u' because there's no other 'u' after the second 'u'.
.PP
What i take from this challenge is that unique character/alphabet is the only character/alphabet in the entire string so if there're more than one character/alphabet then it's not unique. That's why i make sure that character/alphabet is the only one in the string by checking the character/alphabet before and after. With that in mind, here's the code:
.IP
.CW
from fire import Fire

def main(input):
    for i in range(len(input)):
        new_string = input[:i] + input[i+1:]
        if input[i] not in new_string:
            print(i)
            break
        elif i == len(input)-1:
            print(-1)

if __name__ == '__main__':
    Fire(main)
.TC
