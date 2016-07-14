=begin
Methods for creating a list, naming a list, and renaming a list.
Methods for adding items to and deleting items from a list.
Methods for updating the completion status of an item. (If it’s not done, mark it as done, and vice versa.)
At least one method that returns a boolean (ex. def completed?).
Print methods for each of the classes that create a nicely formatted to-do list format.
=end
class TodoList
  attr_accessor :title, :items

  def initialize(listTitle)
    @title = listTitle
    @items = Array.new
  end

  def add_item(new_item)
    item = Item.new(new_item)
    @items.push(item)
  end

  def display_list
    puts "---------------"
    puts " #{title}"
    puts "---------------"
    itemCount = 1
    items.each do |item|
      print "#{itemCount}."
      puts " Description: #{item.description}"
      puts "   Completed?   #{item.completion_status}"
      itemCount = itemCount + 1
    end
  end

  def delete_first_item
    items.delete_at(0)
  end

  def item_completed(item_num)
    items[item_num].completion_status = true
  end

  def update_title(newTitle)
    @title = newTitle
  end

  def export_to_file(fileName)
    if File.exist?(fileName)
      print "#{fileName} (created on #{File.mtime(fileName).strftime("%v %r")}) exists."
      print " Do you want to overwrite?(y/n) "
      input = gets().chomp()
      input.eql?("y"){ writing_to_file(fileName) }
    else
      writing_to_file(fileName)
    end
  end

  def writing_to_file(fileName)
    f = File.open(fileName, 'w')#{|file| file.write(self.display_list); puts "writing"}
    old_stdout = $stdout
    $stdout = f
    display_list
    $stdout = old_stdout
  end

end # class TodoList

class Item
  attr_accessor :description, :completion_status
  def initialize(item_description)
    @description = item_description
    @completion_status = false
  end


end
