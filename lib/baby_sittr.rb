class BabySittr 
    def initialize(options ={})
        @start_time = options[:start_time]
        @end_time = options[:end_time]
    end

    def valid?
        valid_period = ['5PM','6PM', '7PM', '8PM', '9PM', '10PM', '11PM', '12AM', '1AM', '2AM', '3AM', '4AM']
        valid_period.include?(@start_time) && valid_period.include?(@end_time)
    end
end