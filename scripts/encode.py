

input_str = input("Enter a sequence: ")

for char in input_str:
    upper = char.upper()
    upper = f"'{upper}': {hex(ord(upper))}"
    lower = f"'{char}': {hex(ord(char))}"
    print(lower, upper, " | ")