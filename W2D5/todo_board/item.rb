class Item
    attr_accessor :title, :description
    attr_reader :deadline, :done

    def self.valid_date?(date_str)
        arr = date_str.split("-").map(&:to_i)
        if arr.length == 3
            if arr[1] >= 1 && arr[1] <= 12  #month
                if arr[2] >= 1 &&  arr[2] <= 31 #day
                    return true
                end
            end
        end
        false
    end

    def initialize(title, deadline, description)
        if Item.valid_date?(deadline)
            @title = title
            @deadline = deadline
            @description = description
            @done = false
        else
            raise "invalid date"
        end
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise "invalid date"
        end
    end

    def toggle
        if @done
            @done = false
        else
            @done = true
        end
    end

end