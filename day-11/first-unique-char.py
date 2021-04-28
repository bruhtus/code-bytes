from fire import Fire

def main(input):
    for i in range(len(input)):
        new_string = input[:i] + input[i+1:]
        if input[i] not in new_string:
            print(i)
            break
        elif i == len(input)-1:
            print(-1)

if __name__ == '__main__':
    Fire(main)
