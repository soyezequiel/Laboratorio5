class MonstersController < ApplicationController
  def index
    @monsters = Monster.all.order(name: :desc)
  end

  def show
    @monster = Monster.find(params[:id])
  end

  def new
    @elNuevo=Monster.new
  end
  
  def create
    @elNuevo=Monster.new(parametrosStrongMonster)
    if (@elNuevo.save)
      redirect_to edit_monster_path(@elNuevo.id)
    else
      render :new, status: :see_other
    end
  end
  def parametrosStrongMonster 
    params.require(:monster).permit( :name, :description, :phone, :birthdate)
  end

  def edit
    @monsterD=Monster.find(params[:id])
  end

  def update
    @monsterD=Monster.find(params[:id])
    @monsterD.update(parametrosStrongMonster)
    if (@monsterD.save)
      redirect_to monster_path, notice: "Monster creado"
    else
      render :edit
    end
  end
  
  end