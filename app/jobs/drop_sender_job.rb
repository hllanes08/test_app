class DropSenderJob < ActiveJob::Base
  queue_as :email

  def perform(drop_person)
      Person.all.each do |p|
      	UserMailer.deleted_person(p,drop_person).deliver_now
      end    
  end
end
