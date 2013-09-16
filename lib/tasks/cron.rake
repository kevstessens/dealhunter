task :cron => :environment do
  Appointment.all.each do |appointment|
    if appointment.datetime.to_date == DateTime.current.advance(:days=> 1).to_date
      unless appointment.patient_id == 1
        AppointmentReminderMailer.remind_appointment(appointment, appointment.patient.user).deliver
      end
    end
  end
end