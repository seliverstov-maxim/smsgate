class SmsSendWorker
  include Sidekiq::Worker
  def perform(*important_args)
    puts "Doing critical work"
  end
end