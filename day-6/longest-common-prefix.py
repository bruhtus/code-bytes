from fire import Fire

def main(file_input):
    with open(file_input) as f:
        collections = f.read().splitlines()

        #check shortest word from all the word
        compare_len = [len(collections[i]) for i in range(len(collections))]
        min_len = min(compare_len)

        #using shortest word length so that it doesn't give out index out of bounds
        min_list = [s for s in collections if len(s) == min_len]
        min_word = "".join(min_list[0]) #take only one of the shortest word if there are more than one

        for word in collections:
            if len(min_list) > 1 and min_len == 1 and word == min_word:
            #if the character on the shortest word is on the word then add to the list
                result = "".join([char for char in min_word if char in word])
            elif word == min_word:
                pass
            else:
                result = "".join([char for char in min_word if char in word])

        print(result)

if __name__ == '__main__':
    Fire(main)
