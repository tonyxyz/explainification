
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



m2 = fred.method(:method_two)
puts "source method_two #{m2.source_location} -- #{m2.owner}"

m1 = fred.method(:method_one)
puts "source method_one #{m1.source_location} -- #{m1.owner}"

mw = fred.method(:woof)
puts "source woof #{m1.source_location} -- #{m1.owner}"


mu = fred.method(:upcase)
puts "source upcase #{mu.source_location} -- #{mu.owner}\n"

puts mu.inspect


puts "---- Singleton methods"
fred.singleton_methods.each do |sm|
  m = fred.method(sm)
  puts "  %40s : %40s : %16s" % [sm, m.source_location, m.owner]
end
puts "\n"

klass = fred.class
klass.included_modules.each do |imodule|
  puts ".. #{imodule.inspect}"
  imodule.instance_methods(false).each do |imethod|
    m = fred.method imethod
    puts "  %40s : %40s : %16s" % [ imethod, m.source_location, m.owner]

  end

end

