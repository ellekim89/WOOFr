class DogsController < ApplicationController
    before_action :check_auth
require 'petfinder'

  def index
    # petfinder = Petfinder::Client.new(ENV['PETFINDER_API'], ENV['PETFINDER_SECRET'])
    # animal = 'dog'

    # @zip_code = params[:search]
    #pets = petfinder.find_pets(animal, @zip_code)
# @sheldter_id = pets.shelter_id
# @shelter = petfinder.shelter(shelter_id) @
  end

  def show
    @petfinder = Petfinder::Client.new(ENV['PETFINDER_API'], ENV['PETFINDER_SECRET'])
    animal = 'dog'
    @zip_code = params[:search]
    @pets = @petfinder.find_pets(animal, @zip_code)


    # for i in 0...@pets.length do
    #   @shelter_id = @pets[i].shelter_id
    # end

    # @shelter_id = @pets[0].shelter_id

    # @shelter = @petfinder.shelter(@shelter_id)
  end





end
