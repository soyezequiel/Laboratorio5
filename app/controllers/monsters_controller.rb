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
      redirect_to edit_monster_path(1)  #hay que arreglar esto
    else
      render :new
    end
  end
  def parametrosStrongMonster 
    params.require(:monster).permit(:name, :description, :phone, :birthdate)
  end
  def edit
    @monsterD=Monster.find_by(parametrosStrongMonsteredit)
    if (@monsterD.save)
      redirect_to @monsterD, notice: "Monster creado"
    else
      render :new
    end
  end
    def parametrosStrongMonsteredit 
      params.require(:monster).permit(:id)
    end
  end