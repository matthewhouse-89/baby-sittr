class BabySittr 
    @@valid_period = ['5PM','6PM', '7PM', '8PM', '9PM', '10PM', '11PM', '12AM', '1AM', '2AM', '3AM', '4AM']

    def initialize(options ={})
        @start_time = options[:start_time]
        @end_time = options[:end_time]
        @bed_time = options[:bed_time]
    end

    def valid?
        @@valid_period.include?(@start_time) && @@valid_period.include?(@end_time)
    end

    def calculate_pay
        pay_per_hour = 12
        total = 0
        work_period = @@valid_period.slice(@@valid_period.index(@start_time)..@@valid_period.index(@end_time))
        bedtime_index = work_period.index(@bed_time)
        midnight_index = work_period.index('12AM') || -1
    
        work_period.each_with_index do |time, index|
            if index < work_period.size - 1
                if index <= (midnight_index - 1)
                    pay_per_hour = 8
                end

                total += pay_per_hour
            end
        end
        
        "$#{total}"
    end
end