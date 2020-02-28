require_relative "item"
require "byebug"

class List
    attr_accessor :label, :items
    
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        begin
            item = Item.new(title, deadline, description)
            @items << item if !item.nil? 
            if @items.include?(item)
                return true
            else
                return false
            end
        rescue
            return false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        (0...size).include?(index)
    end

    def swap(idx1, idx2)
        if valid_index?(idx1) && valid_index?(idx2)
            @items[idx1], @items[idx2] = @items[idx2], @items[idx1]
            return true
        else
            return false
        end
    end

    def [](index)
        return nil if !valid_index?(index)
        @items[index]
    end

    def priority
        @items.first
    end

    def print
        puts "-----------------------------------------------------"
        puts "                   #{@label.upcase}                  "
        puts "-----------------------------------------------------"
        puts "Index   |       Item        |  Deadline   |    Done  "
        puts "-----------------------------------------------------"

        @items.each_with_index do |item, idx|
            if item.done
                puts "#{idx}".ljust(8) + "| #{item.title}".ljust(20) + "| #{item.deadline}".ljust(14) + "|    [✓]"
            else
                puts "#{idx}".ljust(8) + "| #{item.title}".ljust(20) + "| #{item.deadline}".ljust(14) + "|    [ ]"
            end
        end

        puts "-----------------------------------------------------"
    end

    def print_full_item(index)
        puts "-----------------------------------------------------"
        puts "#{@items[index].title}"
        puts "#{@items[index].deadline}"
        puts "#{@items[index].description}"
        if @items[index].done
            puts "[✓]"
        else
            puts "[ ]"
        end
        puts "-----------------------------------------------------" 
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount=1)
        if valid_index?(index) 
            i = 0
            while i < amount
                break if index == 0
                @items[index], @items[index-1] = @items[index-1], @items[index] 
                index -= 1
                i += 1
            end
            return true
        else
            return false
        end
    end

    def down(index, amount=1)
        if valid_index?(index) 
            i = 0
            while i < amount 
                break if @items[index+1].nil?
                @items[index], @items[index+1] = @items[index+1], @items[index] 
                index += 1
                i += 1
            end
            return true
        else
            return false
        end
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end

    def toggle_item(index)
        @items[index].toggle
    end

    def remove_item(index)
        if valid_index?(index)
            @items.delete_at(index)
            # @items = @items[0...index] + @items[index+1..-1]
            return true
        else
            return false
        end
    end

    def purge
        @items.select! { |item| item.done == false }
    end


end