class TodoList
  attr_accessor :title, :items

  def initialize(listTitle)
    @title = listTitle
    @items = Array.new
    @created = Time.now.asctime
  end


  def display_list(item_array)
    puts "-------------------"
    print " #{title}   "
    puts "created #{@created}"
    puts "-------------------"
    display_item(item_array)
  end

  def display_item(item_array)
    item_array.each_with_index do |item, index|
      print "%d." %[index+1]
      item.display_item
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

  def delete_item(item_number)
    items.delete_at(item_number-1)
  end

  def delete_completed_items
    items.reject!{|item| item.completion_status}
  end

  def mark_item_complete(item_num)
    items[item_num-1].completion_status = true
  end

  def change_item_description(item_index)
    print "Type new description for item #{item_index}: "
    items[item_index-1].change_description
  end

  #########################
  ######  ACCESSORS  ######
  #########################

  def task_completed?(item_num)
    items[item_num-1].completion_status #returns true/false
  end

  def export_to_file(fileName, item_array)
    if File.exist?(fileName)
      print "#{fileName} (created on #{File.mtime(fileName).strftime("%v %r")}) exists."
      print " Do you want to overwrite?(y/n) "
      input = gets.chomp

      if input.eql?("y")
        writing_to_file(fileName, item_array)
        puts "#{fileName} has been overwritten."
      end
    else  # create new file
      writing_to_file(fileName, item_array)
    end
  end

  def writing_to_file(fileName, item_array)
    File.open(fileName, 'w') do |fstream|
      old_stdout = $stdout
      $stdout = fstream  # puts/print output to file
      display_list(item_array)
      $stdout = old_stdout
      fstream.close
    end
  end

  def show_incomplete_items
    puts "Incompleted tasks for list '#{title}'"
    items.each do |item|
      if(!item.completion_status)
        puts item.description
      end
    end
    print "\n"
  end

  def search_by_description(descript)
    item_index = items.index{|details| details.description == descript}
    if item_index
      print "%d." %[item_index]
      items[item_index].display_item
    end
  end

end # class TodoList

class Item
  attr_accessor :description, :completion_status
  def initialize(item_description)
    @description = item_description
    @completion_status = false
  end

  def display_item
    puts " Description: #{self.description}"
    puts "   Completed?   #{self.completion_status}"
  end

  def change_description
    self.description = gets.chomp
  end

end
