from fire import Fire

def main(string1, string2):
    a = str(string1)
    b = str(string2)
    s = bin(int(a, 2) + int(b, 2))
    print(s[2:])

if __name__ == '__main__':
    Fire(main)
