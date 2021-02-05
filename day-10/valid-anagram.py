from fire import Fire

def main(string1, string2):
    anagram = [s1 for s1 in string1 if s1 in string2]

    print(len(anagram) == len(string1))

if __name__ == '__main__':
    Fire(main)
