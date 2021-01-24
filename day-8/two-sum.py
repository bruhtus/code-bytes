from fire import Fire

def main(file_input, target):
    with open(file_input) as f:
        num_array = f.read().splitlines()

        true_sum = ''
        for i in range(len(num_array)):
            num = int(num_array[i])
            plus_array = num_array[:i] + num_array[i+1:]

            for j in plus_array:
                j = int(j)

                if num + j == target:
                    true_sum = num + j == target
                else:
                    false_sum = num + j == target

        print(true_sum) if true_sum != '' else print(false_sum)

if __name__ == '__main__':
    Fire(main)
