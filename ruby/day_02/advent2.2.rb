#!/usr/bin/env ruby

# --- Part Two ---
# Confident that your list of box IDs is complete, you're ready to find the boxes full of prototype fabric.
#
# The boxes will have IDs which differ by exactly one character at the same position in both strings. For example, given the following box IDs:
#
# abcde
# fghij
# klmno
# pqrst
# fguij
# axcye
# wvxyz
#
# The IDs abcde and axcye are close, but they differ by two characters (the second and fourth). However, the IDs fghij and fguij differ by exactly one character, the third (h and u). Those must be the correct boxes.
#
# What letters are common between the two correct box IDs? (In the example above, this is found by removing the differing character from either ID, producing fgij.)

def ids
  @ids ||= STDIN.read.split("\n")
end

def differences(a, b)
  a.chars.zip(b.chars).count { |a, b| a != b }
end

def differences_of_one
  ids.combination(2).select do |a, b|
    differences(a, b) == 1
  end
end

def common_letters
  a, b = differences_of_one.first
  a.chars.zip(b.chars).reject { |a, b| a != b }.map { |a, _| a }
end

puts common_letters.join
