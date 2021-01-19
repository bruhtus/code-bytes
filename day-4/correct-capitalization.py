from fire import Fire

def main(word):
    print(word.isupper() or word.islower() or word == word.capitalize())

if __name__ == '__main__':
    Fire(main)
