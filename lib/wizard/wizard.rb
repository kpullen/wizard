module Wizard
	class Wizard < Creature
		trait :beard_length

		symbol ?w
		speed 1
		beard_length 0

		def grow_beard some_amount = 1
			return if some_amount < 0
			@beard_length += some_amount
		end
	end
end
