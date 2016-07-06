=begin
Methods for creating a list, naming a list, and renaming a list.
Methods for adding items to and deleting items from a list.
Methods for updating the completion status of an item. (If it’s not done, mark it as done, and vice versa.)
At least one method that returns a boolean (ex. def completed?).
Print methods for each of the classes that create a nicely formatted to-do list format.
=end
class TodoList
  attr_reader :title, :items

  def initialize(listTitle)
    @title = listTitle
    @items = Array.new
  end

  def add_item(new_item)
    item = Item.new(new_item)
    @items.push(item)
  end

  def display_list
    puts "List title: #{title}"
    puts "List items: #{items}"
  end
end

class Item
  attr_reader :description, :completion_status
  def initialize(item_description)
    @description = item_description
    @completion_status = false
  end
end
