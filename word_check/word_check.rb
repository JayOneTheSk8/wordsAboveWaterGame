require 'set'
path = File.absolute_path("word_check/words.txt")
dictionary = IO.readlines(path, chomp: true)
DICTIONARY = Set.new(dictionary)

def permutations(word)
  return [word] if word.length < 2
  first = word.shift
  perms = permutations(word)
  total_permutations = []
  perms.each do |perm|
    (0..perm.length).each do |i|
      total_permutations << perm[0...i] + [first] + perm[i..-1]
    end
  end
  total_permutations.sort
end

def substrings(word)
  subs = []
  word.length.times do |start|
    (2..(word.length - start)).each do |fin|
      subs << word[start...(start + fin)]
    end
  end
  subs
end

def all_variations(word)
  to_process = word.split('')
  result = []
  perms = permutations(to_process)
  perms.map do |perm|
    result += substrings(perm.join)
  end
  result.sort_by { |w| w.length }
end
# 
# def real_words(word)
#   all_perms = all_variations(word)
#   real = []
#   all_perms.each do |string|
#     DICTIONARY[string]
#   end
# end
