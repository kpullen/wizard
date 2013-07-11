require "spec_helper"

describe Wizard do
	let(:wizard) { Wizard::Wizard.new }

	it "has a beard" do
		wizard.beard_length.should eq 0
	end

	it "should be able to grow the beard" do
		w = wizard
		w.grow_beard
		w.beard_length.should eq 1

		w.grow_beard 10
		w.beard_length.should eq 11
	end

	it "should NOT shrink the beard" do
		w = wizard
		w.grow_beard -1
		w.beard_length.should eq 0
	end
end
