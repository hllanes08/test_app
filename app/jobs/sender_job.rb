class SenderJob < ActiveJob::Base
  queue_as :email
  def perform(last_person)
      p "Starting sender job"
      Person.all.each do |p|
	p "Email = #{p.email} "
        UserMailer.created_person(p,last_person).deliver_now
      end
      p "Sender Job Finished"
  end
end
