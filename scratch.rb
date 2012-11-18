
BasicObject.instance_eval do
	def explainify
    ghost = eigenclass 
    puts "explainifying #{self} #{ghost}"
    ghost = ghost.eigenclass 
    end
	def eigenclass 
  		class << self
    	self
  	end 
end 



end

BasicObject.class_eval do
  def explainify
    ghost = eigenclass 
    puts "Explainifying #{self} #{ghost}"
    ghost = ghost.eigenclass 
  end
end

def eigenclass 
  class << self
    self
  end 
end 

Object.explainify

String.explainify


module EnhancementModule
  def miaow
    to_s + " ... miaow!"
  end
end

class EnhancedString < String
  
  include EnhancementModule
  def woof
    to_s + " ... woof!"
  end
end

fred = EnhancedString.new("fred")

def fred.method_one
  puts "method one"
end

def fred.method_two
  puts "method two"
end

"fred".explainify

m2 = fred.method(:method_two)
puts "source method_two #{m2.source_location} -- #{m2.owner}"

m1 = fred.method(:method_one)
puts "source method_two #{m1.source_location} -- #{m1.owner}"

mu = fred.method(:upcase)
puts "source upcase #{mu.source_location} -- #{mu.owner}"

fred.singleton_methods.each do |sm|
  puts "singleton method #{sm.inspect}"
end
puts "all singleton methods - #{fred.singleton_methods.inspect}"

klass = fred.class
begin
  puts "class is #{klass} -- #{klass.instance_methods(false)} !! #{klass.included_modules}"
  klass = klass.superclass
end while klass != nil
  

puts fred.miaow




