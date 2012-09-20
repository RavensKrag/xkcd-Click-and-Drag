require 'rubygems'
require 'bundler/setup'
require 'gosu'
require 'require_all'

class GameWindow < Gosu::Window
	def initialize
		@target_fps = 60
		# Window should have a 16:9 aspect ratio
		super(1280, 720, false, (1.0/@target_fps)*1000)
		self.caption = "xkcd: Click and Drag "
		
		# Stream resources from XKCD website
		# This program essentially serves as a viewer for the Click and Drag comment, with
		# some modifications.
	end
	
	def update
		
	end
	
	def draw
		
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
