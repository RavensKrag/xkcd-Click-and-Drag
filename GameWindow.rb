require 'rubygems'
require 'bundler/setup'
require 'gosu'
require 'require_all'

class GameWindow < Gosu::Window
	def initialize
		@target_fps = 60
		super(740, 470, false, (1.0/@target_fps)*1000) # Same size as the pane of the original comic
		self.caption = "xkcd: Click and Drag "
		
		@font = Gosu::Font.new self, "Trebuchet MS", 25
		
		# Stream resources from xkcd website
		# This program essentially serves as a viewer for the Click and Drag comment, with
		# some modifications.
		
		# Recreate the opening panels of the comic, so that they can be animated more throughly
	end
	
	def update
		
	end
	
	def draw
		self.translate 0,0 do
			draw_text "From the stories", 0,0,0
			draw_text ["I expected the",
					"world to be sad"], 30,@font.height,0
			draw_text "and it was", 30, 100,0
			
			#~ draw_text do
				#~ puts "From the stories"
				#~ puts "I expected the"
				#~ puts "world to be sad"
				#~ puts "and it was"
			#~ end
		end
		#~ 
		#~ self.translate 200,0 do
			#~ @font.draw "and I expected it / to be wonderful.",0,0,0
		#~ end
		#~ 
		#~ self.translate 400,0 do
			#~ @font.draw "it was.",0,0,0
		#~ end
		#~ 
		#~ self.translate 50, 200 do
			#~ @font.draw "I just didn't expect / it to be so BIG",0,0,0
		#~ end
	end
	
	def button_down(id)
		case id
			when Gosu::KbEscape
				exit
		end
	end
	
	def button_up(id)
		
	end
	
	private
	
	# Render text with newlines
	def draw_text(lines, x=0, y=0, z=0)
		#~ lines = string.split("\n")
		if lines.respond_to? :each_with_index
			self.translate x,y do
				lines.each_with_index do |l, i|
					@font.draw l, 0, i*@font.height, z
				end
			end
		else
			# Drawing only one line
			@font.draw lines, x, y, z
		end
	end
end
