require 'sinatra/base'
require './lib/diary'

class DiaryManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/entries' do
    @diary_entries = Diary.view_all
    erb :entries
  end

  !run if app_file == $0
end