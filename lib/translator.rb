 require "yaml"
def load_library(emoticons)
  emoticons = YAML.load_file(emoticons)
  get_meaning = {}
  get_emoticon = {}
  emoticons.each_pair do |meaning, emoji_array|
    english = emoji_array[0]
    japanese = emoji_array[1]
    get_meaning[japanese] = meaning
    get_emoticon[english] = japanese
  end
  emoji_hash = {
     :get_meaning => get_meaning,
     :get_emoticon => get_emoticon
   }

  emoji_hash
end

def get_japanese_emoticon(emoticons, eng_emoji)
  emoji_hash = load_library(emoticons)
  jap_emoji = emoji_hash[:get_emoticon][eng_emoji]
  if jap_emoji
    jap_emoji
  else
     "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(emoticons, jap_emoji)
  emoji_hash = load_library(emoticons)
  eng_meaning = emoji_hash[:get_meaning][jap_emoji]
  if eng_meaning
    eng_meaning
  else
     "Sorry, that emoticon was not found"
  end
end
