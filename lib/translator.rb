require 'yaml'

def load_library(filepath)
  new_hash = {get_meaning: {}, get_emoticon: {}}

  YAML.load_file(filepath).each do |item|

    new_hash[:get_meaning][item[1][1]] = item[0]
    new_hash[:get_emoticon][item[1][0]] = item[1][1]

  end

  return new_hash

end

def get_japanese_emoticon(filepath, emoticon)

  new_hash = load_library(filepath)

  if new_hash[:get_emoticon][emoticon]

    rstring = new_hash[:get_emoticon][emoticon]

  else

    rstring = "Sorry, that emoticon was not found"

  end

  return rstring

end

def get_english_meaning(filepath, emoticon)

    new_hash = load_library(filepath)

    if new_hash[:get_meaning][emoticon]

      rstring = new_hash[:get_meaning][emoticon]

    else

      rstring = "Sorry, that emoticon was not found"

    end

    return rstring

end
