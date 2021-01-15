f = open('input', 'r')

string = f.readlines()

for s in string:
    print(s[::-1])
