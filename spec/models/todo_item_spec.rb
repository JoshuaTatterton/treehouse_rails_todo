describe TodoItem do
  it { should belong_to(:todo_list) }

  describe "#completed?" do
    let(:todo_item) { TodoItem.create(content: "Hello") }

    it "is false when completed_at is blank" do 
      todo_item.completed_at = nil

      expect(todo_item.completed?).to eq false
    end

    it "is true when completed_at is not blank" do 
      todo_item.completed_at = Time.now
      
      expect(todo_item.completed?).to eq true
    end
  end
end
