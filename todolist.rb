=begin
At least one method that returns a boolean (ex. def completed?).
Print methods for each of the classes that create a nicely formatted to-do list format.
=end
class TodoList
  attr_accessor :title, :items

  def initialize(listTitle)
    @title = listTitle
    @items = Array.new
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
    print "\n"
  end
  ########################
  ######  MUTATORS  ######
  ########################

  def update_title(newTitle)
    @title = newTitle
  end

  def add_item(new_item)
    item = Item.new(new_item)
    @items.push(item)
  end

  def delete_first_item
    items.delete_at(0)
  end

  def mark_item_complete(item_num)
    items[item_num].completion_status = true
  end

  #########################
  ######  ACCESSORS  ######
  #########################
  def task_completed?(item_num)
    puts items[item_num].completion_status
  end

  def export_to_file(fileName)
    if File.exist?(fileName)
      print "#{fileName} (created on #{File.mtime(fileName).strftime("%v %r")}) exists."
      print " Do you want to overwrite?(y/n) "
      input = gets().chomp()
      input.eql?('y'){ writing_to_file(fileName) }
    else
      writing_to_file(fileName)
    end
  end

  def writing_to_file(fileName)
    f = File.open(fileName, 'w')
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
