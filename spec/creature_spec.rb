require "spec_helper"

describe Creature do
	let :simple_creature do
		class SimpleCreature < Creature
			trait :arm_length
			arm_length :long
			speed 1
		end
		SimpleCreature.new
	end

	let :fast_creature do
		class FastCreature < Creature
			speed 2
		end
		FastCreature.new
	end

	let :proc_creature do
		class ProcCreature < Creature
			trait :proc_please
			proc_please -> { 1 }
		end
		ProcCreature.new
	end

	it "has traits" do
		-> { simple_creature }.should_not raise_error
	end

	it "handles procified traits" do
		c = proc_creature
		c.proc_please.should eq 1
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

	it "has a speed" do
		c = fast_creature
		c.move :north
		c.position.should eq [0, 2]
	end
end
