# require modules here
require "yaml"

def load_library(file)
  hash_form_file = YAML.load_file(file)
  emoticons = {"get_meaning" => {}, "get_emoticon" => {}}
  hash_form_file.each do |emotion, ejarray|
    emoticons["get_meaning"][ejarray[1]] = emotion
    emoticons["get_emoticon"][ejarray[0]] = ejarray[1]
  end 
  return emoticons
end

def get_japanese_emoticon(file, e_emoticon)
  new_file = load_library(file)
  new_file["get_emoticon"].each do |pair|
    if pair[0] === e_emoticon
      return pair[1]
    end 
  end 
  return "Sorry, that emoticon was not found"
end 

def get_english_meaning(file, j_emoticon)
  new_file = load_library(file)
  new_file["get_meaning"].each do |pair|
    if pair[0] === j_emoticon
      return pair[1]
    end 
  end 
  return "Sorry, that emoticon was not found"
end




