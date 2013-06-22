def turk_drb
  @turk_drb ||= Drb::Turk.new.drb
end

Then /^work must be created for task "(.*?)" in turk app$/ do |task_title|
  work = turk_drb.find_object(:work, {:description => task_title})
  work['id'].should_not be_nil
end
