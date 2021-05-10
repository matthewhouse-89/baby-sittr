class BabySittr 
    def initialize(options ={})
        @start_time = options[:start_time]
        @end_time = options[:end_time]
    end

    def valid?
        @start_time == '5PM'
    end
end