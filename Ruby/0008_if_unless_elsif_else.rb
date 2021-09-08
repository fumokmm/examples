x = 10

# if ---------------------------
puts 'if'
if x == 10
  puts 'xは10です'
end
# => xは10です

# if-else ----------------------
puts 'if-else'
if x == 5
  puts 'xは5です'
else
  puts "xは5じゃなくて#{x}です"
end
# => xは5じゃなくて10です

# if-elsif-else ----------------
puts 'if-elsif-else'
if x == 5
  puts 'xは5です'
elsif x == 10
  puts 'xは10です'
else
  puts "xは5でも10でもなく#{x}です"
end
# => xは10です

# unless -----------------------
puts 'unless'
unless x > 10
  puts 'xは10より大きくないです'
end
# => xは10より大きくないです

# unless-else ------------------
puts 'unless-else'
unless x <= 10
  puts 'xは10以下ではないです'
else
  puts 'xは10以上です'
end
# => xは10以上です
