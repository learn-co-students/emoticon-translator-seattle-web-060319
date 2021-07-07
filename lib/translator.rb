# require modules here
require "yaml"
def load_library(path)
  # code goes here
  hash = YAML.load_file(path)
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  hash.each do |meaning, emoticons|
    result["get_meaning"][emoticons[1]] = meaning
    result["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  result
end

def get_japanese_emoticon(path, icon)
  # code goes here
  path = load_library(path)
  if path["get_emoticon"].has_key?(icon)
    path["get_emoticon"][icon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, icon)
  if load_library(path)["get_meaning"].has_key?(icon)
    load_library(path)["get_meaning"][icon]
  else
    "Sorry, that emoticon was not found"
  end
  # code goes here
end