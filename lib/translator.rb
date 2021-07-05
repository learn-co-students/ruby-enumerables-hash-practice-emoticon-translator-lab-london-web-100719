

def load_library(path)
  
  require "yaml"
  new_hash = YAML.load_file(path)
  
  emoticon = { "get_meaning": {}, "get_emoticon": {} }
    
    new_hash.each do |meaning,emoticons|
      emoticon[:get_meaning][emoticons[1]] = meaning
      emoticon[:get_emoticon][emoticons[0]] = emoticons[1]
    end
    emoticon
end

def get_japanese_emoticon(path, emoticon_symbol)
  
emoti_lib = load_library(path)

if emoti_lib[:get_emoticon].include? emoticon_symbol
  answer = emoti_lib[:get_emoticon][emoticon_symbol]
else
  answer = "Sorry, that emoticon was not found"
end
answer
end

def get_english_meaning(path, emoticon_symbol)
  
  emoti_lib = load_library(path)

if emoti_lib[:get_meaning].include? emoticon_symbol
  answer = emoti_lib[:get_meaning][emoticon_symbol]
else
  answer = "Sorry, that emoticon was not found"
end
answer
end