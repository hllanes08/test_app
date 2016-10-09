class SenderJob < ActiveJob::Base
  queue_as :email

  def perform(last_person)
      Person.all.each do |p|
        UserMailer.created_person(p,last_person).deliver_now
      end
  end
end
