require 'rails_helper'

RSpec.describe "Tasks", type: :request do
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
          due_date: 'daily'
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
          due_date: 'daily'
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
          due_date: 'daily'
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
          due_date: 'daily'
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
          due_date: 'daily'
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
          due_date: 'daily'
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
          due_date: nil  
        }
      }
      post '/tasks', params: task_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['due_date']).to include "can't be blank" 


    end
  end
end
