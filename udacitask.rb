require_relative 'todolist.rb'

# Creates a new todo list
list = TodoList.new("List1")

# Add four new items
list.add_item("item1")
list.add_item("Do Homework")
list.add_item("Do Chores")
list.add_item("Pick up Jimmy")

# Change an item's description
list.change_item_description(1)

list.export_to_file("export.txt", list.items)

# Print the list
list.display_list(list.items)

# Delete the first item
list.delete_item(1)

# Print the list
list.display_list(list.items)

# Delete the second item
list.delete_item(2)

# Print the list
list.display_list(list.items)

# Update the completion status of the first item to complete
list.mark_item_complete(1)

# Print the list
list.display_list(list.items)

# Update the title of the list
list.update_title("NEW LIST TITLE")

# Print the list
list.display_list(list.items)

list.search_by_description("Pick up Jimmy")

if(list.task_completed?(1))
  puts "Yes it was completed."
end
list.delete_completed_items

list.display_list(list.items)



