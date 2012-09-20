require 'rubygems'
require 'bundler/setup'
require 'gosu'
require 'require_all'

class GameWindow < Gosu::Window
	def initialize
		@target_fps = 60
		super(740, 470, false, (1.0/@target_fps)*1000) # Same size as the pane of the original comic
		self.caption = "xkcd: Click and Drag "
		
		@font = Gosu::Font.new self, "Trebuchet MS", 34
		
		# Stream resources from xkcd website
		# This program essentially serves as a viewer for the Click and Drag comment, with
		# some modifications.
		
		# Recreate the opening panels of the comic, so that they can be animated more throughly
	end
	
	def update
		
	end
	
	def draw
		self.translate 0,0 do
			@font.draw "From the stories",0,0,0
			@font.draw "I expected the / world to be sad",0,0,0
			@font.draw "and it was",0,0,0
		end
		
		self.translate 200,0 do
			@font.draw "and I expected it / to be wonderful.",0,0,0
		end
		
		self.translate 400,0 do
			@font.draw "it was.",0,0,0
		end
		
		self.translate 50, 200 do
			@font.draw "I just didn't expect / it to be so BIG",0,0,0
		end
	end
	
	def button_down(id)
		case id
			when Gosu::KbEscape
				exit
		end
	end
	
	def button_up(id)
		
	end
end
