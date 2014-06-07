def encrypt(data, shift_factor)
	# Currently only encrypts text within ascii values 65 to 122
	words = data.split(" ")
	words.map! do |word|
		letters = word.split("")
		letters.map! do |letter|
			byte = letter.ord
			if (byte.between?(65, 122) && !(byte.between?(91, 96)))	
				# subtract by number of letters if we go over Z or z
				# or below a or A when decrypting
				if (byte <= 90)
					byte -= 26 if (byte + shift_factor > 90)
					byte += 26 if (byte + shift_factor < 65)
				elsif (byte <= 122)
					byte -= 26 if (byte + shift_factor > 122)
					byte += 26 if (byte + shift_factor < 97)
				end

				byte += shift_factor
			end
			byte.chr
		end
		letters.join("")
	end
	words.join(" ")
end

def decrypt(data, shift_factor)
	# Call this with the shift factor that it was encrypted with to decrypt it
	encrypt(data, -shift_factor)
end
