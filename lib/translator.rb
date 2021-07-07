require "yaml"

def load_library(file_path)
  theHash = {get_meaning: {},get_emoticon: {}}
  
  YAML.load_file(file_path).each { |key, value|
    theHash[:get_emoticon[value[0]] = key[1]
    theHash[:get_meaning][value[1]] = key
  }
  return theHash
  
end

def get_japanese_emoticon(file_path, emoticon)
  result = load_library(file_path)[:get_emoticon][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  result = load_library(file_path)[:get_meaning][emoticon]
  result ? result: "Sorry, that emoticon was not found"
end