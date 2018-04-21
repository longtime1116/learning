class Task
  attr_accessor :name, :parent

  def initialize(name)
    @name = name
    @parent = nil
  end

  def get_time_required
    0.0
  end
end

class CompositeTask < Task
  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def [](index)
    @sub_tasks[index]
  end

  def <<(task)
    @sub_tasks << task
    task.parent = self
  end

  def remove_sub_task(task)
    @sub_tasks.delete(task)
    task.parent = nil
  end

  def get_time_required
    puts "#{name}"
    total_time = @sub_tasks.reduce(0.0) do |total, task|
      puts "  #{task.name}"
      total + task.get_time_required
    end
  end
end

class AddDryIngredientsTask < Task
  def initialize
    super("Add dry ingredients")
  end

  def get_time_required
    1.0
  end
end

class AddLiquidsTask < Task
  def initialize
    super("Add liquids")
  end

  def get_time_required
    2.0
  end
end

class MixTask < Task
  def initialize
    super("Mix that batter up!")
  end

  def get_time_required
    3.0
  end
end

class MakeBatterTask <  CompositeTask
  def initialize
    super("Make batter")
    self << AddDryIngredientsTask.new
    self << AddLiquidsTask.new
    self << MixTask.new
  end
end

make_butter = MakeBatterTask.new
p make_butter.get_time_required
p make_butter[0].name
p make_butter[0].parent.name
