string = ['level', 'algorithm', 'A man, a plan, a canal: Panama']

for s in string:
    s_without_symbols = s.replace(',', '').replace(':', '').replace(' ', '')
    print(f'{s} -> true') if s_without_symbols.lower() == s_without_symbols.lower()[::-1] else print(f'{s} -> false')
