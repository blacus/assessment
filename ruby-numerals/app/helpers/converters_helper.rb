module ConvertersHelper
	
	NUMERICALS = {
		0 => 'zero',	
		1 => 'one',	
		2 => 'two',		
		3 => 'three',		
		4 => 'four',		
		5 => 'five',		
		6 => 'six',
		7 => 'seven',		
	    8 => 'eight',        
		9 => 'nine',
		10 => 'ten',
		11 => 'eleven',
		12 => 'twelve',
		13 => 'thirteen',
		14 => 'fourteen',
		15 => 'fifteen',
		16 => 'sixteen',
		17 => 'seventeen',
		18 => 'eighteen',
		19 => 'nineteen',
		20 => 'twenty',
		30 => 'thirty',
		40 => 'forty',
		50 => 'fifty',
		60 => 'sixty',
		70 => 'seventy',	
		80 => 'eighty',
		90 => 'ninety',
		100 => 'hundred',
	}	

	LOTS = {	
		1000 => 'thousand',
		1000000 => 'million',
		1000000000 => 'billion',
		1000000000000 => 'trillion',
		1000000000000000 => 'quadrillion',
		1000000000000000000 => 'quintillion',
		
	}

	class::Numeric	
		def humanize

			output = []	

			if self == 0 
				output << NUMERICALS[self]
			else
				divider = (self < 2000 && self > 1099) ? 100 : 1000
				input = get_nums divider
				length = input.count
				
				if divider == 100

					input.each_with_index{ |n, i|  		
						str = "#{convert n}"
						str = (i == length-2) ? "#{str} hundred and" : str
						output << str
					}				
					
				else
					input.each_with_index{ |n, i|  
						num = convert n							
						unless num.nil?		
							str = (i != length-1)? "#{num} #{LOTS[divider**(length-i-1)]}" :  "#{num}"
							str = (length > 1 && i == length-1 && n < 100) ? "and " + str : str
							output <<  str						
						end
					}	

				end
			end
			output.join(", ").sub(/(, and)|( and,)/, " and").sub(/ and zero/, "")

		end	


		def convert num
			
			arr = num.to_s.split(//).map{|i| i.to_i}	
			arr.reverse!

			case arr.count
				when 1
		  			single_part arr
				when 2
		  			decimal_part arr
				when 3
		  			hundred_part arr
			end				
		end		


		def single_part arr
			"#{NUMERICALS[arr[0]]}" if arr[0] > 0
		end


		def decimal_part arr								
			arr[1] < 2 || arr[0] == 0 ? "#{NUMERICALS[ (arr[1]*10) + arr[0] ]}" : "#{NUMERICALS[arr[1]*10]}-#{NUMERICALS[arr[0]]}" 			
		end


		def hundred_part arr		
			"#{decimal_part arr}".empty? ? "#{NUMERICALS[arr[2]]} hundred" : "#{NUMERICALS[arr[2]]} hundred and #{decimal_part arr}"			
		end		


		def get_nums divider
			num = self
			arr = []			
			while num != 0
				num, r = num.divmod(divider)								
				arr << r
			end	
			arr.reverse 
		end
	end	
end
