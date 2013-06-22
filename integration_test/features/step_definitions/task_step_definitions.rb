def drb
  @drb ||= Drb::Todo.new.drb
end

Given /^I have todo list "(.*?)"$/ do |list_title|
  @list = drb.create_object(:list, {title: list_title})
end

Given /^I add task "(.*?)" to "(.*?)" in todo app$/ do |task_title, list_title|
  @task = drb.create_object(:task, {title: task_title, list_id: @list['id']})
end

When /^I delegate task$/ do
  task_page = Page::Todo::TaskPage.new(@task['id'])
  visit task_page.url
  click_button 'Delegate'
end

Then /^task status should be assigned in todo app$/ do
  task = drb.find_object(:task, {:id => @task['id']})
  task['status'].should == 'assigned'
end
