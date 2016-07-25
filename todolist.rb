class TodoList
  attr_accessor :title, :items

  def initialize(listTitle)
    @title = listTitle
    @items = Array.new
    @created = Time.now.asctime
  end


  def display_list
    puts "-------------------"
    print " #{title}   "
    puts "created #{@created}"
    puts "-------------------"
    itemNumber = 1
    items.each do |item|
      print "#{itemNumber}."
      puts " Description: #{item.description}"
      puts "   Completed?   #{item.completion_status}"
      itemNumber += 1
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

  def delete_completed_items
    items.reject!{|item| item.completion_status}
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
      input = gets.chomp

      if input.eql?("y")
        writing_to_file(fileName)
        puts "#{fileName} has been overwritten."
      end
    else  # create new file
      writing_to_file(fileName)
    end
  end

  def writing_to_file(fileName)
    File.open(fileName, 'w') do |fstream|
      old_stdout = $stdout
      $stdout = fstream  # puts/print output to file
      display_list
      $stdout = old_stdout
      fstream.close
    end
  end

  def show_incomplete_items
    puts "Incompleted tasks for list '#{title}'"
    items.each do |item|
      if(item.completion_status)
        puts item.description
      end
    end
    print "\n"
  end

  def search_by_description(descript)
    item_index = items.index{|details| details.description == descript}
    if item_index
      puts "#{item_index}. Description: #{items[item_index].description}"
      puts "   Completion status: #{items[item_index].completion_status}"
    end
  end
end # class TodoList

class Item
  attr_accessor :description, :completion_status
  def initialize(item_description)
    @description = item_description
    @completion_status = false
  end

end
