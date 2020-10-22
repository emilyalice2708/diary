require 'pg'
require 'sinatra/base'
require './lib/diary'

class DiaryManager < Sinatra::Base
  get '/diary' do
    erb :'/diary/index'
  end

  get '/diary/entries' do
    @diary_entries = Diary.view_all
    erb :'/diary/entries'
  end

  get '/diary/new' do
    erb :'/diary/new'
  end

  post '/diary/entries' do
    Diary.add(params[:entry])
    redirect to '/diary/entries'
  end

  !run if app_file == $0
end