class Flight
    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        @passengers.length == @capacity
    end

    def board_passenger(passenger_inst)
        if !full?
            @passengers << passenger_inst if passenger_inst.has_flight?(@flight_number)
        end
    end

    def list_passengers
        names = []
        @passengers.each do |ele|
            names << ele.name
        end
        names
    end

    def [](idx)
        @passengers[idx]
    end

    def <<(passenger_inst)
        self.board_passenger(passenger_inst)
    end

end