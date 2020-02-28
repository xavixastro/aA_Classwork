require_relative "list"

class TodoBoard
    def initialize
        @hash = {}
    end

    def get_command
        print "\nEnter a command: "
        
        cmd, label, *args = gets.chomp.split(" ")

        # user inputs

        case cmd
        when "mklist"
            # cmd, name of list, remaining arguments
            @hash[label.upcase] = List.new(label.upcase)
        when "ls"
            @hash.each do |k,v|
                puts k
            end
        when "showall"
            @hash.each do |k,v|
                v.print
            end
        when "mktodo"
            @hash[label.upcase].add_item(*args)
        when "up"
            @hash[label.upcase].up(*args.map(&:to_i))
        when "down"
            @hash[label.upcase].down(*args.map(&:to_i))
        when "swap"
            @hash[label.upcase].swap(*args.map(&:to_i))
        when "sort"
            @hash[label.upcase].sort_by_date!
        when "priority"
            @hash[label.upcase].print_priority
        when "print"
            if !args.empty?
                @hash[label.upcase].print_full_item(*args.map(&:to_i)) 
            else
                @hash[label.upcase].print
            end
        when "toggle"
            @hash[label.upcase].toggle_item(*args.map(&:to_i))
        when "rm"
            @hash[label.upcase].remove_item(*args.map(&:to_i))
        when "purge"
            @hash[label.upcase].purge
        when "quit"
            return false
        else
            print "command not recognized"
        end

        true
    end

    def run
        continue = true
        while continue
            continue = get_command
        end
    end
end




# single list functionality
# require_relative "list"
# class TodoBoard
#     def initialize(label)
#         @list = List.new(label)
#     end

#     def get_command
#         print "\nEnter a command: "
        
#         #mktodo groceries 2020-04-25 description
#         cmd, *args = gets.chomp.split(" ")
#         #cmd = mktodo
#         #args = [gorceries , 2020-04-25 , description>]

#         #up 0 3
#         #cmd = up
#         #args = [0, 3]

#         case cmd
#         when "mktodo"
#             @list.add_item(*args)
#         when "up"
#             @list.up(*args.map(&:to_i))
#         when "down"
#             @list.down(*args.map(&:to_i))
#         when "swap"
#             @list.swap(*args.map(&:to_i))
#         when "sort"
#             @list.sort_by_date!
#         when "priority"
#             @list.print_priority
#         when "print"
#             if !args.empty?
#                 @list.print_full_item(*args.map(&:to_i)) 
#             else
#                 @list.print
#             end
#         when "toggle"
#             @list.toggle_item(*args.map(&:to_i))
#         when "rm"
#             @list.remove_item(*args.map(&:to_i))
#         when "purge"
#             @list.purge
#         when "quit"
#             return false
#         else
#             print "command not recognized"
#         end

#         true
#     end

#     def run
#         continue = true
#         while continue
#             continue = get_command
#         end
#     end
# end


