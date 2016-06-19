class NegotiationtypesController < ApplicationController

  # Index action(i.g. 'my')
  def index
    @negotiationtypes = Negotiationtype.all
  end

  def new
    @negotiationtype = Negotiationtype.new
  end

  def show
    @negotiationtype = Negotiationtype.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @negotiationtype }
    end
  end

  def edit
    @negotiationtype = Negotiationtype.find(params[:id])
  end

  def create
    @negotiationtype = Negotiationtype.new(negotiationtype_params)

    if @negotiationtype.save
      redirect_to @negotiationtype, notice: t('flash.notice.negotiationtype_created')
    else
      render :new
    end
  end

  def update
    @negotiationtype = Negotiationtype.find(params[:id])

    if @negotiationtype.update(negotiationtype_params)
      redirect_to @negotiationtype, notice: 'Tipo de negociação atualizada com sucesso'
    else
      render action: edit
    end
  end

  def destroy
    @negotiationtype = Negotiationtype.find(params[:id])  # Verificar necessidade
    @negotiationtype.destroy
    redirect_to negotiationtypes_url
  end

  private
    def set_negotiationtype
      @negotiationtype = Negotiationtype.find(params[:id])
    end

    def negotiationtype_params
      params.require(:negotiationtype).permit(:description)
    end
end