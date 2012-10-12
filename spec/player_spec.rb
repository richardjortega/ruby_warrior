require 'rubygems'
require 'rspec'
require 'rspec-mocks'
require '../player'

describe Player do
	before do
		@player = Player.new
		@warrior = Object.new
	end

	it "checks for damage" do
		@warrior.expects(:look).returns([])
		@player.play_turn(@warrior)

	end
	
end