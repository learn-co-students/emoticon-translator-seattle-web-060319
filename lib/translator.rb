# require modules here
require 'yaml'

# emoticons = YAML.load_file('./lib/emoticons.yml')

def load_library(file_path)
	emoticons = YAML.load_file(file_path)
	words = emoticons.keys
	eng_emot = emoticons.values.map {|x| x[0]}
	jap_emot = emoticons.values.map {|x| x[1]}	
	library = {
		"get_meaning" => jap_emot.zip(words).to_h,
		"get_emoticon" => eng_emot.zip(jap_emot).to_h
	}
	return library
end

def get_japanese_emoticon(file_path,emoticon)
	library = load_library(file_path)
	result = library["get_emoticon"].select {|k,v| k == emoticon}
	if result.empty?
		return "Sorry, that emoticon was not found"
	else
		return result.values.join
	end
end

def get_english_meaning(file_path, emoticon)
	library = load_library(file_path)
	result = library["get_meaning"].select {|k,v| k == emoticon}
	if result.empty?
		return "Sorry, that emoticon was not found"
	else
		return result.values.join
	end
end