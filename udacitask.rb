require_relative 'todolist.rb'

# Creates a new todo list
list = TodoList.new("List1")
# Add four new items
list.add_item("item1")
list.add_item("Do Homework")
list.add_item("Do Chores")
list.add_item("Pick up Jimmy")

# Print the list
list.display_list

# Delete the first item
list.delete_first_item

# Print the list
list.display_list

# Delete the second item
list.delete_first_item
# Print the list
list.display_list

# Update the completion status of the first item to complete
list.item_completed(0)

# Print the list
list.display_list

# Update the title of the list
list.update_title("New List Title")

# Print the list
list.display_list

list.export_to_file("export.txt")