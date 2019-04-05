class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do
    @titles = Title.all
    erb :"figures/new"
  end

  post '/figures' do
    binding.pry
    figure = Figure.create(name: params[:figure][:name])
    titles = Title.select do |title|
      params[:title].include?(title)
    end

    titles.each do |title|
      FigureTitle.create(figure: figure, title: title)
    end
    redirect '/figures'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    erb :"figures/edit"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(name: params[:name])
    redirect "/figures/#{figure.id}"
  end


end
