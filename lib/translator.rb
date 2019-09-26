require "yaml"

def load_library(file_path)
  library = YAML.load_file(file_path)
  new_hash = {get_meaning: {}, get_emoticon: {}} # this could be more versatile with an if/else instantiation
  library.keys.each do |meanings|
    new_hash[:get_meaning][library[meanings][1]] = meanings
    new_hash[:get_emoticon][library[meanings][0]] = library[meanings][1]
    # {:get_meaning=> {"☜(⌒▽⌒)☞"=>"angel", "ヽ(ｏ`皿′ｏ)ﾉ"=>"angry}
    # {:get_emoticon=> {"O:)"=>"☜(⌒▽⌒)☞", ">:("=>"ヽ(ｏ`皿′ｏ)ﾉ"}
  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  if emoticon_hash[:get_emoticon][emoticon]
    return emoticon_hash[:get_emoticon][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  if emoticon_hash[:get_meaning][emoticon]
    return emoticon_hash[:get_meaning][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end




