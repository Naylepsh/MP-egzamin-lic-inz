def edges(r):
    total = 0
    for start_x in range(r):
        for start_y in range(r):
            for end_x in range(r):
                for end_y in range(r):
                    if start_x == start_y and end_x == end_y:
                        continue
                    if (
                        start_y == end_y
                        start_x == end_x or
                        start_y == end_y or
                        start_x + start_y == end_x + end_y or
                        start_x - start_y == end_x - end_y
                    ):
                        total += 1
                        # print(f'({start_x}, {start_y}) : ({end_x}, {end_y})')
    return total / 2


for i in range(2, 10):
    print(i, edges(i))
