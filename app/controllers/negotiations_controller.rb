class NegotiationsController < ApplicationController

  # Index action(i.g. 'my')
  def index
    @negotiations = Negotiation.order(:created_at)
  end

  def new
    @negotiation = Negotiation.new
  end

  def show
    @negotiation = Negotiation.find(params[:id])
  end

  def edit
    @negotiation = Negotiation.find(params[:id])
  end

  def create
    @negotiation = Negotiation.new(negotiation_params)

    if @negotiation.save
        respond_to do |format|
          format.html { redirect_to @negotiation, notice: t('flash.notice.@negotiation_created') }
          format.json { render json: @negotiation }
        end
    else
      render :new
    end
  end

  def update
    @negotiation = Negotiation.find(params[:id])


    if @negotiation.update(negotiation_params)
      redirect_to @negotiation, notice: 'Negociação atualizada com sucesso'
    else
      render action: edit
    end
  end

  def destroy
    @negotiation = Negotiation.find(params[:id])  # Verificar necessidade
    @negotiation.destroy
    redirect_to transactions_url
  end

  private
    def set_negotiation
      @negotiation = Negotiation.find(params[:id])
    end

    def negotiation_params
      params.require(:negotiation).permit(:product_id, :negotiationtype_id, :amount, :product_price, :total_price)
    end
end