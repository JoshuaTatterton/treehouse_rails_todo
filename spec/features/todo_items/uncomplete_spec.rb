describe "Uncompleting todo items" do

  let!(:todo_list) { TodoList.create(title: "Shopping", description: "shopping")}
  let!(:todo_item) { todo_list.todo_items.create(content: "Milk", completed_at: 1.minute.ago) }

  it "is successful" do
    expect(todo_item.completed_at).not_to be_nil
    visit_todo_list(todo_list)
    within dom_id_for(todo_item) do
      click_link "Mark Incomplete"
    end
    todo_item.reload
    expect(todo_item.completed_at).to be_nil
  end

  context "with uncompleted items" do
  
    it "asks to be completed" do
      visit_todo_list(todo_list)
      within dom_id_for(todo_item) do
        click_link "Mark Incomplete"
      end
      within dom_id_for(todo_item) do
        expect(page).to have_link("Mark Complete")
      end
    end 

    it "doesn't give the option to mark complete" do 
      visit_todo_list(todo_list)
      within dom_id_for(todo_item) do
        click_link "Mark Incomplete"
      end
      within dom_id_for(todo_item) do
        expect(page).not_to have_link("Mark Incomplete")
      end
    end
  end

end