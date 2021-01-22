from fire import Fire

def main(file_input):
    with open(file_input) as f:
        string = f.read().splitlines()

        for s in string:
            print(s[::-1].strip())

if __name__ == '__main__':
    Fire(main)
