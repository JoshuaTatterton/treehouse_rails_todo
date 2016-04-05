module ToDoListHelpers
  def visit_todo_list(todo_list)
    visit "/todo_lists"
    
    within dom_id_for(todo_list) do
      click_link "List Items"
    end
  end
end