NOVEL_LENGTH = 50_000

MEOW_HEADER = "---\nThe following words are added to the end of this text to meet an arbitrary word count:"

# https://stackoverflow.com/a/1416074
def word_counter(line)
  line.split.size
end

# https://stackoverflow.com/a/8624335
original_file = "input_file.md"

new_file = "output_file.md"

File.open(new_file, 'w') do |fo|

  total_number_of_words = 0

  File.foreach(original_file) do |li|
    total_number_of_words += word_counter(li)
    fo.puts li
  end

  if (NOVEL_LENGTH > total_number_of_words)
    total_number_of_words += word_counter(MEOW_HEADER)
    fo.puts MEOW_HEADER

    words_to_add = NOVEL_LENGTH - total_number_of_words

    if (words_to_add > 0)
      fo.puts ("meow " * words_to_add)
    end
  end
end