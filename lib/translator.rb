require 'yaml'

def load_library(file_path)
  # Load the appropriate yaml file of emoticons
  emoticons_hash = YAML.load_file('./lib/emoticons.yml')
  
  # Define a backbone hash for reorganising the emoticons by language
  emoticons_by_lang = {
    :get_meaning => {}, 
    :get_emoticon => {}
  }
  
  # Visit each key-value pair in emoticons_hash to construct emoticons_by_lang
  emoticons_hash.each do |meaning, emoticons|
    emoticons_by_lang[:get_meaning] = emoticons_by_lang[:get_meaning].merge({emoticons[1] => meaning})
    emoticons_by_lang[:get_emoticon] = emoticons_by_lang[:get_emoticon].merge({emoticons[0] => emoticons[1]})
  end
  emoticons_by_lang
end

def get_japanese_emoticon(file_path, eng_emoticon)
  # Call on load_library to be able to get its returned result
  emoticons_by_lang = load_library(file_path)
  
  # Assign a standard message to be returned if a Japanese equivalent for an English emoticon is not found
  message = "Sorry, that emoticon was not found"
  
  # If the English emoticon exists as a key in the get_emoticon hash, return its value as the valid Japanese emoticon. Otherwise, return the message
  emoticon_pairs = emoticons_by_lang[:get_emoticon]
  
  if emoticon_pairs.include?(eng_emoticon)
    jap_emoticon = emoticon_pairs[eng_emoticon]
  else
    message
  end
end

def get_english_meaning(file_path, jap_emoticon)
  # Call on load_library to be able to get its returned result
  emoticons_by_lang = load_library(file_path)
  
  # Assign a standard message to be returned if the Japanese emoticon is not found
  message = "Sorry, that emoticon was not found"
  
  # If the Japanese emoticon exists as a key in the get_meaning hash, return its value as the valid English meaning. Otherwise, return the message
  emoticon_pairs = emoticons_by_lang[:get_meaning]
  
  if emoticon_pairs.include?(jap_emoticon)
    eng_meaning = emoticon_pairs[jap_emoticon]
  else
    message
  end
end