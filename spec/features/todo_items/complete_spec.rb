describe "Completing todo items" do

  let!(:todo_list) { TodoList.create(title: "Shopping", description: "shopping")}
  let!(:todo_item) { todo_list.todo_items.create(content: "Milk") }

  it "is successful" do
    expect(todo_item.completed_at).to be_nil
    visit_todo_list(todo_list)
    within dom_id_for(todo_item) do
      click_link "Mark Complete"
    end
    todo_item.reload
    expect(todo_item.completed_at).not_to be_nil
  end
end