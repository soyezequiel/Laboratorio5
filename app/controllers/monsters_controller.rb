class MonstersController < ApplicationController
  def index
    @monsters = Monster.all.order(name: :desc)
  end

  def show
    @monster = Monster.find(params[:id])
  end
  def create
    @nuevoMonster=Monster.new(parametrosStrongMonster)
    if (@nuevoMonster.save)
      redirect_to @nuevoMonster
    else
      render :new
    end
  end
  def parametrosStrongMonster 
    params.require(:monster).permit(:name, :description, :phone, :birthdate)
  end
  end