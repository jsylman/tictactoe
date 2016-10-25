class NewGame
	def initialize
		@player_x = []
		@player_o = []
		@board = [1,2,3,4,5,6,7,8,9]
		@last = "O"
		@won= false
		@@winning_combos = [[1,2,3],[4,5,6],[7,8,9],[3,5,7],
		[1,4,7],[2,5,8],[3,6,9],[1,5,9]]
		i=1
		draw()
		while !@won && i<10
			guess()
			draw()
			i+=1
			if i == 10 && !@won
				puts "It's a tie!"
			end
		end

	end
	def draw
		print @board[0].to_s+" | "+@board[1].to_s+" | "+@board[2].to_s+"\n"
		print @board[3].to_s+" | "+@board[4].to_s+" | "+@board[5].to_s+"\n"
		print @board[6].to_s+" | "+@board[7].to_s+" | "+@board[8].to_s+"\n"
	end

	def select(player, selection, letter)
		if @board.include? selection
			player.push(selection)
			@board[selection-1] = letter
			@last = letter
			if checkwon(player) && @won == true
				puts letter+" won!"
			end
		else 
			puts "Already chosen - select again"
		end
	end

	def checkwon(player)
		@@winning_combos.each do |x|
			if (player.sort & x) == x
				@won = true
				return true
			end
		end
	end


	def guess
		if @last == "X"
			puts "Player O make selection"
			selection = gets.chomp.to_i
			select(@player_o, selection, "O")
		else
			puts "Player X make selection"
			selection = gets.chomp.to_i
			select(@player_x, selection, "X")
		end
	end
end

myGame = NewGame.new()

