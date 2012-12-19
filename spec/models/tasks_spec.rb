# task_spec.rb

describe Task, "#create" do
  it "returns 10 after creating 10 elements" do
    10.times {Task.create :name=> "Tarea"}
    Task.all.length.should eq(10)
  end
end