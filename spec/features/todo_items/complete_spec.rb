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

  context "with completed items" do
    let!(:completed_todo_item) { todo_list.todo_items.create(content: "Eggs", completed_at: 5.minutes.ago) }
  
    it "shows completed items as complete" do
      visit_todo_list(todo_list)

      within dom_id_for(completed_todo_item) do
        expect(page).to have_content(completed_todo_item.completed_at.strftime("Completed at: %M:%H, %d/%m/%y"))
      end
    end 

    it "doesn't give the option to mark complete" do 
      visit_todo_list(todo_list)
      
      within dom_id_for(completed_todo_item) do
        expect(page).not_to have_link("Mark Complete")
      end
    end
  end
end