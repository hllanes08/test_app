class SenderJob < ActiveJob::Base
  queue_as :email
  self.queue_adapter = :resque
  def perform(last_person)
      p "Starting sender job"
      Person.all.each do |p|
        UserMailer.created_person(p,last_person).deliver_now
      end
  end
end
