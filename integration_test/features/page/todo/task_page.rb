module Page
  module Todo
    class TaskPage
      attr_reader :url

      def initialize(task_id)
        @url = "http://localhost:3001/tasks/#{task_id}"
      end
    end
  end
end
