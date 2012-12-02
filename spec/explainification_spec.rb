require (File.join(File.dirname(__FILE__), "..", "lib", "explainification.rb"))

describe "The explainification" do
  it "lists the methods on a simple string" do
    explanation = method_list "fred"
    
    # TODO test all of strings methods
    ["<=>","==","==="].each do |im|
      explanation.should include im.to_s
    end
    
  end
end 