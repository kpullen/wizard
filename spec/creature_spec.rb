require "spec_helper"

describe Creature do
	let :simple_creature do
		class SimpleCreature < Creature
			trait :arm_length
			arm_length :long
		end
		SimpleCreature.new
	end

	it "has traits" do
		-> { simple_creature }.should_not raise_error
	end

	it "assigns traits on instance creation" do
		simple_creature.arm_length.should eq :long
	end

	it "has a position in space" do
		simple_creature.position.should eq [0, 0]
	end

	it "can move around" do
		c = simple_creature
		c.move :north
		c.position.should eq [0, 1]
		c.move :south
		c.position.should eq [0, 0]
		c.move :east
		c.position.should eq [1, 0]
		c.move :west
		c.position.should eq [0, 0]
	end

end