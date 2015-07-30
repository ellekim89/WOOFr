class DogsController < ApplicationController
    before_action :check_auth
    protect_from_forgery :except => :show
require 'petfinder'

  def index

  end

  def create

  end


  def show
    @petfinder = Petfinder::Client.new(ENV['PETFINDER_API'], ENV['PETFINDER_SECRET'])
    animal = 'dog'
    @zip_code = params[:search]
    @dogs = @petfinder.find_pets(animal, @zip_code)

    @dogs_db = []

    @dogs.each do |dog|
      @dogs_pic = dog.photos[0].medium if dog.photos[0]

      search_dog = Dog.find_by pf_id: dog.id
        if search_dog != nil
          @saveDog = search_dog
        else
          @saveDog = Dog.new({"name" => dog.name, "pf_id" => dog.id, "description" => dog.description,
        "photo" => @dogs_pic})
          @saveDog.save
        end
      @dogs_db << @saveDog
    end


  end




end
