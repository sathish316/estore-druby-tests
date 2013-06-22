require 'drb_helper'

desc "start drb server for tests"
namespace :test do
  task :start_drb => :environment do
    puts "Starting Warehouse DRb server"
    DRb.start_service('druby://localhost:5003', DRbHelper.new)
    DRb.thread.join
  end
end
