module Wizard
	class Creature
		class << self
			def trait a_trait
				@traits ||= {}
				attr_accessor a_trait
				define_singleton_method a_trait do |value|
					@traits[a_trait] = value
				end
			end
			def traits *some_traits
				@traits ||= {}
				return @traits if some_traits.empty?
				some_traits.each do |a_trait|
					trait a_trait
				end
			end
		end

		attr_reader :position
		def initialize
			self.class.traits.each do |name, value|
				self.send "#{name}=", value
			end
			@position = [0, 0]
		end

		def move direction
			[:north].include?(direction) && position[1] += 1
			[:south].include?(direction) && position[1] -= 1
			[:east].include?(direction) && position[0] += 1
			[:west].include?(direction) && position[0] -= 1
		end
	end
end
