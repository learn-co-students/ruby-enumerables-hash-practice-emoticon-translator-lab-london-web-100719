# require modules here
require "yaml"
require "pry"

def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file("./" + "#{file_path}")
 
  # emoticons = {"angel"=>["O:)", "☜(⌒▽⌒)☞"]} #=> sample of hash
  
  emos_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  
  emoticons.each do |meaning, array|
    emos_hash["get_meaning"][array[1]] = meaning
    emos_hash["get_emoticon"][array[0]] = array[1]
    
    # meaning  #=> meaning “angel”
    # array[1]  #=> japanese emoticon "☜(⌒▽⌒)☞"
    # array[0]  #=> english emoticon "O:)"
  end
  
  emos_hash
  
=begin
  emos_hash = {
    "get_meaning" => {
  	    "☜(⌒▽⌒)☞" => "angel" #=> "Japanese emoticons" => “meaning"
      },

    "get_emoticon" => {
  	    "O:)" => "☜(⌒▽⌒)☞"  #=>	“English emoticons" => “Japanese emoticons"
      }
  }
=end
  
end
  
def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  # take a traditional Western emoticon
  # like :) and translate it to its Japanese version
  
  translate = load_library(file_path)["get_emoticon"][emoticon]
  if !translate
    return "Sorry, that emoticon was not found"
  else
    translate  
  end
end
  
def get_english_meaning(file_path, emoticon)
  # code goes here
  # takes a Japanese emoticon and returns its meaning in English
  
  meaning = load_library(file_path)["get_meaning"][emoticon]
  if !meaning
    return "Sorry, that emoticon was not found"
  else
    meaning
  end
end