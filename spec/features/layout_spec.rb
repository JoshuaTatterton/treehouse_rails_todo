describe "Navigating Pages" do

  let!(:empty_todo_list) { TodoList.create(title: "Shopping", description: "shopping") }
  let!(:completed_todo_list) { TodoList.create(title: "Done stuff", description: "stuff that have done") }
  let!(:incomplete_todo_list) { TodoList.create(title: "Not done stuff", description: "stuff I haven't done") }
  let!(:completed_todo_item) { completed_todo_list.todo_items.create(content: "Milk", completed_at: 1.minute.ago) }
  let!(:incomplete_todo_item) { incomplete_todo_list.todo_items.create(content: "Milk") }

  it "can display all completed todo lists" do
    visit "/"
    click_link "Completed Todo Lists"
    
    expect(page).to have_content(empty_todo_list.title)
    expect(page).to have_content(completed_todo_list.title)
    expect(page).not_to have_content(incomplete_todo_list.title)
  end

  it "can display all uncompleted todo lists" do
    visit "/"
    click_link "Incomplete Todo Lists"
    
    expect(page).not_to have_content(empty_todo_list.title)
    expect(page).not_to have_content(completed_todo_list.title)
    expect(page).to have_content(incomplete_todo_list.title)
  end

end