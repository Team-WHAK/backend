require 'rails_helper'

RSpec.describe "Tasks", type: :request do

  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  describe "POST /create" do
    it "doesn't create a task without an area" do
      task_params = {
        task: {
          area: nil,
          item: 'Stove',
          picture: 'img',
          task_name: 'clean',
          task_descr: 'wipe down surface',
          frequency: 'daily',
          due_date: 'daily',
          user_id: user.id
        }
      }
      post '/tasks', params: task_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['area']).to include "can't be blank" 
    end

    it "doesn't create a task without an item" do
      task_params = {
        task: {
          area: '1233',
          item: nil,
          picture: 'img',
          task_name: 'clean',
          task_descr: 'wipe down surface',
          frequency: 'daily',
          due_date: 'daily',
          user_id: user.id
        }
      }
      post '/tasks', params: task_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['item']).to include "can't be blank" 
    end

    it "doesn't create a task without a picture" do
      task_params = {
        task: {
          area: '1233',
          item: 'Stove',
          picture: nil,
          task_name: 'clean',
          task_descr: 'wipe down surface',
          frequency: 'daily',
          due_date: 'daily',
          user_id: user.id
        }
      }
      post '/tasks', params: task_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['picture']).to include "can't be blank" 
    end

    it "doesn't create a task without a task-name" do
      task_params = {
        task: {
          area: '1233',
          item: 'Stove',
          picture: 'img',
          task_name: nil,
          task_descr: 'wipe down surface',
          frequency: 'daily',
          due_date: 'daily',
          user_id: user.id
        }
      }
      post '/tasks', params: task_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['task_name']).to include "can't be blank" 
      end

    it "doesn't create a task without a task_descr" do
      task_params = {
        task: {
          area: '1233',
          item: 'Stove',
          picture: 'img',
          task_name: 'clean',
          task_descr: nil,
          frequency: 'daily',
          due_date: 'daily',
          user_id: user.id
        }
      }
      post '/tasks', params: task_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['task_descr']).to include "can't be blank" 
    end

    it "doesn't create a task without a frequency" do
      task_params = {
        task: {
          area: '1233',
          item: 'Stove',
          picture: 'img',   
          task_name: 'clean',
          task_descr: 'wipe down surface',
          frequency: nil,
          due_date: 'daily',
          user_id: user.id,
          user_id: user.id
        }
      }
      post '/tasks', params: task_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['frequency']).to include "can't be blank" 
      end

    it "doesn't create a task without a due_date" do
      task_params = {
        task: {
          area: '1233',
          item: 'Stove',
          picture: 'img',
          task_name: 'clean',
          task_descr: 'wipe down surface',
          frequency: 'daily',
          due_date: nil  ,
          user_id: user.id
        }
      }
      post '/tasks', params: task_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['due_date']).to include "can't be blank" 


    end
  end

  describe "PATCH /update" do

    it "updates a task with valid attributes" do
    
      task = user.tasks.create(
        area: 'Backyard',
        item: 'Stove',
        picture: 'img',
        task_name: 'clean',
        task_descr: 'wipe down surface',
        frequency: 'daily',
        due_date: '23 Aug 2023',
        user_id: user.id
      )

      get '/tasks'

      updTask = Task.first
      updTask_params ={
        task: {
          area: 'Porch',
          item: 'Microwave',
          picture: 'images',
          task_name: 'break',
          task_descr: 'snap in half',
          frequency: 'monthly',
          due_date: '17 Jul 2023',
          user_id: user.id
        }
      }

      patch "/tasks/#{updTask.id}", params: updTask_params
      task = JSON.parse(response.body)

      expect(response).to have_http_status(200)

      expect(task['area']).to eq('Porch')
      expect(task['item']).to eq('Microwave')
      expect(task['picture']).to eq('images')
      expect(task['task_name']).to eq('break')
      expect(task['task_descr']).to eq('snap in half')
      expect(task['frequency']).to eq('monthly')
      expect(task['due_date']).to eq('17 Jul 2023')
    
    end

    it "doesn't update a task without an area" do
      task = user.tasks.create(
        area: 'Backyard',
        item: 'Stove',
        picture: 'img',
        task_name: 'clean',
        task_descr: 'wipe down surface',
        frequency: 'daily',
        due_date: '23 Aug 2023',
        user_id: user.id
      )

      get '/tasks'

      updTask = Task.first
      updTask_params ={
        task: {
          area: nil,
          item: 'Stove',
          picture: 'img',
          task_name: 'clean',
          task_descr: 'wipe down surface',
          frequency: 'daily',
          due_date: '23 Aug 2023', 
          user_id: user.id
        }
      }

      patch "/tasks/#{updTask.id}", params: updTask_params
      task = JSON.parse(response.body)

      expect(response).to have_http_status(422)   
      expect(task['area']).to include("can't be blank") 
      
    end

    it "doesn't update a task without an item" do
      task = user.tasks.create(
        area: 'Backyard',
        item: 'Stove',
        picture: 'img',
        task_name: 'clean',
        task_descr: 'wipe down surface',
        frequency: 'daily',
        due_date: '23 Aug 2023',
        user_id: user.id
      )

      get '/tasks'

      updTask = Task.first
      updTask_params ={
        task: {
          area: 'Backyard',
          item: nil,
          picture: 'img',
          task_name: 'clean',
          task_descr: 'wipe down surface',
          frequency: 'daily',
          due_date: '23 Aug 2023', 
          user_id: user.id
        }
      }

      patch "/tasks/#{updTask.id}", params: updTask_params
      task = JSON.parse(response.body)

      expect(response).to have_http_status(422)   
      expect(task['item']).to include("can't be blank") 
      
    end

    it "doesn't update a task without a picture" do
      task = user.tasks.create(
        area: 'Backyard',
        item: 'Stove',
        picture: 'img',
        task_name: 'clean',
        task_descr: 'wipe down surface',
        frequency: 'daily',
        due_date: '23 Aug 2023',
        user_id: user.id
      )

      get '/tasks'

      updTask = Task.first
      updTask_params ={
        task: {
          area: 'Backyard',
          item: 'Stove',
          picture: nil,
          task_name: 'clean',
          task_descr: 'wipe down surface',
          frequency: 'daily',
          due_date: '23 Aug 2023', 
          user_id: user.id
        }
      }

      patch "/tasks/#{updTask.id}", params: updTask_params
      task = JSON.parse(response.body)

      expect(response).to have_http_status(422)   
      expect(task['picture']).to include("can't be blank") 
      
    end

    it "doesn't update a task without a task_name" do
      task = user.tasks.create(
        area: 'Backyard',
        item: 'Stove',
        picture: 'img',
        task_name: 'clean',
        task_descr: 'wipe down surface',
        frequency: 'daily',
        due_date: '23 Aug 2023',
        user_id: user.id 
      )

      get '/tasks'

      updTask = Task.first
      updTask_params ={
        task: {
          area: 'Backyard',
          item: 'Stove',
          picture: 'img',
          task_name: nil,
          task_descr: 'wipe down surface',
          frequency: 'daily',
          due_date: '23 Aug 2023', 
          user_id: user.id
        }
      }

      patch "/tasks/#{updTask.id}", params: updTask_params
      task = JSON.parse(response.body)

      expect(response).to have_http_status(422)   
      expect(task['task_name']).to include("can't be blank") 
      
    end

    it "doesn't update a task without a task_descr" do
      task = user.tasks.create(
        area: 'Backyard',
        item: 'Stove',
        picture: 'img',
        task_name: 'clean',
        task_descr: 'wipe down surface',
        frequency: 'daily',
        due_date: '23 Aug 2023',
        user_id: user.id
      )

      get '/tasks'

      updTask = Task.first
      updTask_params ={
        task: {
          area: 'Backyard',
          item: 'Stove',
          picture: 'img',
          task_name: 'clean',
          task_descr: nil,
          frequency: 'daily',
          due_date: '23 Aug 2023', 
          user_id: user.id
        }
      }

      patch "/tasks/#{updTask.id}", params: updTask_params
      task = JSON.parse(response.body)

      expect(response).to have_http_status(422)   
      expect(task['task_descr']).to include("can't be blank") 
      
    end

    it "doesn't update a task without a frequency" do
      task = user.tasks.create(
        area: 'Backyard',
        item: 'Stove',
        picture: 'img',
        task_name: 'clean',
        task_descr: 'wipe down surface',
        frequency: 'daily',
        due_date: '23 Aug 2023',
        user_id: user.id
      )

      get '/tasks'

      updTask = Task.first
      updTask_params ={
        task: {
          area: 'Backyard',
          item: 'Stove',
          picture: 'img',
          task_name: 'clean',
          task_descr: 'wipe down surface',
          frequency: nil,
          due_date: '23 Aug 2023', 
          user_id: user.id
        }
      }

      patch "/tasks/#{updTask.id}", params: updTask_params
      task = JSON.parse(response.body)

      expect(response).to have_http_status(422)   
      expect(task['frequency']).to include("can't be blank") 
      
    end

    it "doesn't update a task without a due_date" do
      task = user.tasks.create(
        area: 'Backyard',
        item: 'Stove',
        picture: 'img',
        task_name: 'clean',
        task_descr: 'wipe down surface',
        frequency: 'daily',
        due_date: '23 Aug 2023',
        user_id: user.id
      )

      get '/tasks'

      updTask = Task.first
      updTask_params ={
        task: {
          area: 'Backyard',
          item: 'Stove',
          picture: 'img',
          task_name: 'clean',
          task_descr: 'wipe down surface',
          frequency: 'daily',
          due_date: nil, 
          user_id: user.id
        }
      }

      patch "/tasks/#{updTask.id}", params: updTask_params
      task = JSON.parse(response.body)

      expect(response).to have_http_status(422)   
      expect(task['due_date']).to include("can't be blank") 
      
    end

  end
end
