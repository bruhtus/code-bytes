from fire import Fire

def main(jewels, stones):
    similar = [j for j in stones if j in jewels]

    print(f'Stones that are also jewels: {len(similar)}')

if __name__ == '__main__':
    Fire(main)
