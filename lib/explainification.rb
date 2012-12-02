BasicObject.instance_eval do
  def explainify
    puts "explainification (instance eval) pending  #{self.inspect}"
    puts method_list self
  end
end

BasicObject.class_eval do
  def explainify
    puts "explainification pending (class eval) #{self.inspect}"
    puts method_list self
    puts "....."
  end
end

def method_list obj

  "singleton methods:\n".tap do |s|
    obj.singleton_methods.each do |sm|
      m = obj.method(sm)
      s << "  %40s : %40s : %16s\n" % [sm, m.source_location, m.owner]
    end
    klass = obj.class
    [klass].concat(klass.included_modules).each do |imodule|
      s << "#{imodule}:\n"
      imodule.instance_methods(false).each do |imethod|
        m = obj.method imethod
        s << "  %40s : %40s : %16s\n" % [ imethod, m.source_location, m.owner]
      end
    end
  end
end

