require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :new   #first gets "/new" w the form to fill in
  end

  post '/student' do
    @student = Student.new(params[:student])

    params[:student][:courses].each do |details|
      Course.new(details)
    end
    @courses = Course.all
    erb :student  #then shows it in student profile 
  end

end
