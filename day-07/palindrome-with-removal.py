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
