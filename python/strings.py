# 1.write a program to create a new string made of an input string's first, middle and last character

# def create_new_string(input_string):
#     if len(input_string) == 0:
#         print("Please enter a string")
#         new_input = input("Enter a string: ")
#         create_new_string(new_input)
#     else:
#         first_character = input_string[0]
#         middle_character = input_string[int(len(str1) / 2)]
#         result = first_character+middle_character
#         last_character = input_string[-1]
#         result = result+last_character
#         print(result)
# str1 = input("Enter a string:")
# create_new_string(str1)

#2.Write a program to create a new string made of the middle three characters of an input string

# def middle_three_characters(string1):
#     middle_letter_index = int(len(string1)/2)
#     print(middle_letter_index)
#     new_string =  string1[middle_letter_index - 1:middle_letter_index+2]
#     print(new_string)
# string1 = input("Enter a string:")
# middle_three_characters(string1)

#3.Append new string in the middle of a given string

#
#def append_string(str1, str2):
#     middle_index = int(len(str1)/2)
#     result = str1[0:middle_index]+str2+str1[middle_index:]
#     return result
# str1 = input("Enter string:")
# str2 = input("Enter another string:")
# result = append_string(str1, str2)
# print(result)

#4.Given a string contains a combination of the lower and upper case letters. Write a program to arrange characters
#such that all lower case should come first

# def lower_characters_first(str1):
#     lowercase = ''
#     uppercase = ''
#     length = int(len(str1))
#     for character in range(length):
#
#         if str1[character].islower():
#              lowercase = lowercase+str1[character]
#         else:
#             uppercase = uppercase+str1[character]
#     return lowercase+uppercase
# str1 = input("Enter a string:")
# final_string = lower_characters_first(str1)
# print(final_string)

#5.Count all letters, digits, special symbols from given string

# def find_digits_chars_symbols(sample_str):
#     char_count = 0
#     digit_count = 0
#     symbol_count = 0
#     for char in sample_str:
#         if char.isalpha():
#             char_count += 1
#         elif char.isdigit():
#             digit_count += 1
#         # if it is not letter or digit then it is special symbol
#         else:
#             symbol_count += 1
#
#     print("Chars =", char_count, "Digits =", digit_count, "Symbol =", symbol_count)
#
# sample_str = "P@yn2at&#i5ve"
# print("total counts of chars, Digits, and symbols \n")
# find_digits_chars_symbols(sample_str)

#6.Create a new program to create a new string s3 made of the first character of s1, then the last char of s2,
#next the second character of s1 and second last char of s2 and so on
# s1 = "Abc"
# s2 = "Xyz"
#
# # get string length
# s1_length = len(s1)
# s2_length = len(s2)
#
# # get length of a bigger string
# length = s1_length if s1_length > s2_length else s2_length
# result = ""
#
# # reverse s2
# s2 = s2[::-1]
#
# # iterate string
# # s1 ascending and s2 descending
# for i in range(length):
#     if i < s1_length:
#         result = result + s1[i]
#     if i < s2_length:
#         result = result + s2[i]
#
# print(result)

#7.Write a program to check if two strings are balanced. For example, strings s1 and s2 are balanced if all the characters in the s1 are present in s2.
# The character’s position doesn’t matter.

def string_balance_test(s1, s2):
    flag = True
    for char in s1:
        if char in s2:
            continue
        else:
            flag = False
    return flag


s1 = "Yn"
s2 = "PYnative"
flag = string_balance_test(s1, s2)
print("s1 and s2 are balanced:", flag)

s1 = "Ynf"
s2 = "PYnative"
flag = string_balance_test(s1, s2)
print("s1 and s2 are balanced:", flag)

#8..

