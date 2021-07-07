require "yaml"# require modules here

def load_library(the_file_path)
  library = YAML.load_file(the_file_path)
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |meaning, emoticons|
    result["get_meaning"][emoticons[1]] = meaning
    result["get_emoticon"][emoticons[0]] =emoticons[1]
  end
  result# code goes here
end

def get_japanese_emoticon(the_YAML_file_path, the_emoticon)
  library = load_library(the_YAML_file_path)
  if library["get_emoticon"].include?(the_emoticon)
    library["get_emoticon"][the_emoticon]
  else
    "Sorry, that emoticon was not found"
  end# code goes here
end

def get_english_meaning(the_YAML_file_path, the_emoticon)
  library = load_library(the_YAML_file_path)
  if library["get_meaning"].include?(the_emoticon)
    library["get_meaning"][the_emoticon]
  else 
    "Sorry, that emoticon was not found"
  end
end
