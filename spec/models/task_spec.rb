require 'rails_helper'

RSpec.describe Task, type: :model do
  it "should validate area is present" do
    task = Task.create
    expect(task.errors[:area]).to_not be_empty
  end

  it "should validate item is present" do
    task = Task.create
    expect(task.errors[:item]).to_not be_empty
  end

  it "should validate picture is present" do
    task = Task.create
    expect(task.errors[:picture]).to_not be_empty
  end

  it "should validate task_name is present" do
    task = Task.create
    expect(task.errors[:task_name]).to_not be_empty
  end

  it "should validate task_descr is present" do
    task = Task.create
    expect(task.errors[:task_descr]).to_not be_empty
  end

  it "should validate frequency is present" do
    task = Task.create
    expect(task.errors[:frequency]).to_not be_empty
  end

  it "should validate due_date is present" do
    task = Task.create
    expect(task.errors[:due_date]).to_not be_empty
  end
  
  it "should validate user_id is present" do
    task = Task.create
    expect(task.errors[:user_id]).to_not be_empty
  end

end