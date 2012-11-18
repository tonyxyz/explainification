BasicObject.instance_eval do
  def explainify
    puts "explainification pending"
  end
end

BasicObject.class_eval do
  def explainify
    puts "explainification pending"
  end
end    