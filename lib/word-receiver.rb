require 'ruby-dictionary'

class WordReceiver
def initialize (first_word, last_word)
	@first_word=first_word
	@last_word=last_word
	@dictionary = Dictionary.from_file('/usr/share/dict/words') 
	@counter=0
end 

def change_letters
	current_word=nil #we need to define it so we can continue 
	matched = false #does letter 1a and 1b match? 
	@first_word.each_char.with_index do |char_first_word, index|#this takes a string and saves letter of first word and position aka index for each character 
		if char_first_word!=@last_word[index] # && matched
			current_word = @first_word.clone 
			current_word[index] = @last_word[index]
			if @dictionary.exists?(current_word)
				matched = true
				@first_word=current_word
				puts @first_word
			end
		end
	end

	if current_word!=@last_word
		
		if @counter<1000
			@counter+=1
			change_letters
		else
			puts "yo homie, change your words"
		end
end	
  
  end

  def display
  	puts @first_word
  	change_letters
  end
end

test = WordReceiver.new("worth", "tryst")
test.display
# CAT--> DOG 
