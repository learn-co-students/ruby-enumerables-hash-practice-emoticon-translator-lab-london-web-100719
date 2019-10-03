require "yaml"


def load_library(p)
  
  emoties = YAML.load_file(p)
  
  newh = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }

  emoties.map do |key,value|
    newh['get_emoticon'][value[0]] = emoties[key][1]
    newh['get_meaning'][value[1]] = key
    
  end

  newh
  
end

def get_japanese_emoticon(p, emotie)
  
  result = load_library(p)['get_emoticon'][emotie]
  result ? result : "Sorry, that emoticon was not found"
  
end

def get_english_meaning(p, emotie)
  
  result = load_library(p)['get_meaning'][emotie]
  result ? result : "Sorry, that emoticon was not found"
  
end