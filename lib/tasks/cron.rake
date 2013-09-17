task :cron => :environment do
  #Appointment.all.each do |appointment|
  #  if appointment.datetime.to_date == DateTime.current.advance(:days=> 1).to_date
  #   unless appointment.patient_id == 1
  #      AppointmentReminderMailer.remind_appointment(appointment, appointment.patient.user).deliver
  #    end
  #  end
  #end
  Offer.all.each do |offer|
    if offer.start_date.to_date == DateTime.current.to_date
      offer.clients.each do |client|
        OfferStartMailer.offer_start_email(client).deliver
      end
    end
  end
end