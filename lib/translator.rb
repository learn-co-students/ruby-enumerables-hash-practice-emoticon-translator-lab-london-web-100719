# require modules here
require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)

  emoticon_hash = {
    :get_meaning => {},
    :get_emoticon => {}
  }

  emoticons.each do |key, value|
    #key = english meaning 
    emoticon_hash[:get_meaning][value[1]] = key
    emoticon_hash[:get_emoticon][value[0]] = emoticons[key][1]
  end

  return emoticon_hash
end

def get_japanese_emoticon(file_path, emoticon_eng)
  library = load_library(file_path)
  
  if library[:get_emoticon][emoticon_eng]
    return library[:get_emoticon][emoticon_eng]
  else 
    return "Sorry, that emoticon was not found"
  end 
end

def get_english_meaning(file_path, emoticon_jap)
  library = load_library(file_path)
  
  if library[:get_meaning][emoticon_jap]
    return library[:get_meaning][emoticon_jap]
  else 
    return "Sorry, that emoticon was not found"
  end 
end

#load_library("/home/agile-framework-0068/ruby-enumerables-hash-practice-emoticon-translator-lab-london-web-100719/lib/emoticons.yml")