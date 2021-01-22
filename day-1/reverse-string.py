from fire import Fire

def main(file_input):
    f = open(file_input, 'r')

    string = f.readlines()

    for s in string:
        print(s[::-1].strip())

if __name__ == '__main__':
    Fire(main)
