from fire import Fire

def main(moves):
    #complementary move, up complement down and left complement right
    UD = 0
    LR = 0

    for m in moves:
        #print(m)
        if m == 'U':
            UD += 1
        elif m == 'D':
            UD -= 1
        elif m == 'L':
            LR += 1
        elif m == 'R':
            LR -= 1

    if UD == 0 and LR == 0:
        print('true')
    else:
        print('false')

if __name__ == '__main__':
    Fire(main)
