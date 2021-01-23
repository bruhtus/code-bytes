from fire import Fire

def main(input):
    #string = ['level', 'algorithm', 'A man, a plan, a canal: Panama.']

    #for s in string:
        #s_without_symbols = s.replace(',', '').replace(':', '').replace(' ', '')
        #print(f'{s} -> true') if s_without_symbols.lower() == s_without_symbols.lower()[::-1] else print(f'{s} -> false')

    input_without_symbols = input.replace(',', '').replace(':', '').replace(' ', '').replace('.', '')
    print(input_without_symbols.lower() == input_without_symbols.lower()[::-1])

if __name__ == '__main__':
    Fire(main)
