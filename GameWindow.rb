require 'rubygems'
require 'bundler/setup'
require 'gosu'
require 'require_all'

class GameWindow < Gosu::Window
	def initialize
		@target_fps = 60
		super(740, 470, false, (1.0/@target_fps)*1000) # Same size as the pane of the original comic
		self.caption = "xkcd: Click and Drag "
		
		# Stream resources from xkcd website
		# This program essentially serves as a viewer for the Click and Drag comment, with
		# some modifications.
		
		# Recreate the opening panels of the comic, so that they can be animated more throughly
		# 
		# TODO:	Either draw these images using the texture coordinates of the original image,
		# 		or cut up the image beforehand.  Doing it on load is pretty slow.
		comic = Gosu::Image.new self, "./sprites/click_and_drag.png", false
		@text_boxes = [
			Gosu::Image.new(self, comic, false, 51,9, 180-51,33-9),
			Gosu::Image.new(self, comic, false, 70,37, 198-70,79-37),
			Gosu::Image.new(self, comic, false, 114,174, 202-115,198-174),
			
			Gosu::Image.new(self, comic, false, 225,7, 366-225,49-7), 
			
			Gosu::Image.new(self, comic, false, 495,172, 554-495,197-172)
			
			# Last bit of text is contained in the first tile of the tilemap
			#~ Gosu::Image.new(self, comic, false, 225,7, 366-225,49-7)
		]
		
		# TODO: Load the text box from the first tile of tilemap
		# TODO: Blank out where the text box should be
		# TODO: Blank out where the balloon holding man should be, so he can be animated
	end
	
	def update
		
	end
	
	def draw
		# Fill screen with white.
		fill = Gosu::Color::WHITE
		draw_quad	0,0, fill,
					self.width,0, fill,
					self.width,self.height, fill,
					0,self.height, fill
		
		# TODO: Draw panel outlines
		# TODO: Set position of text relative to the panels
		# TODO: Provide animation facilities
			# TODO: Implement animation tweening
			# TODO: Allow movement of panels
			# TODO: Allow movement of text independent, of panels (relative coords)
			# TODO: Allow advanced animation capabilities, such as scaling and opacity
		self.translate 0,0 do
			@text_boxes[0].draw 51,9,0
			@text_boxes[1].draw 70,37,0
			@text_boxes[2].draw 114,174,0
		end
		
		self.translate 0,0 do
			@text_boxes[3].draw 225,7,0
		end
		
		self.translate 0,0 do
			@text_boxes[4].draw 495,172,0
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
