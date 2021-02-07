class Appointment < ApplicationRecord
    belongs_to :doctor
    belongs_to :patient

    def pretty_date
        self.appointment_datetime.strftime("%B %d, %Y")
    end
    def pretty_time
        self.appointment_datetime.strftime("%H:%M")
    end

    def pretty_date_time
        self.appointment_datetime.strftime("%B %d, %Y at %H:%M")
    end
end
