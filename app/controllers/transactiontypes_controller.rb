class TransactiontypesController < ApplicationController

  # Index action(i.g. 'my')
  def index
    @transactiontypes = Transactiontype.all
  end

  def new
    @transactiontype = Transactiontype.new
  end

  def show
    @transactiontype = Transactiontype.find(params[:id])
  end

  def edit
    @transactiontype = Transactiontype.find(params[:id])
  end

  def create
    @transactiontype = Transactiontype.new(transactiontype_params)

    if @transactiontype.save
      redirect_to @transactiontype, notice: t('flash.notice.@transactiontype_created')
    else
      render :new
    end
  end

  def update
    @transactiontype = Transactiontype.find(params[:id])

    if @transactiontype.update(transactiontype_params)
      redirect_to @transactiontype, notice: 'Tipo de transação atualizada com sucesso'
    else
      render action: edit
    end
  end

  def destroy
    @transactiontype = Transactiontype.find(params[:id])  # Verificar necessidade
    @transactiontype.destroy
    redirect_to transactiontypes_url
  end

  private
    def set_transactiontype
      @transactiontype = Transactiontype.find(params[:id])
    end

    def transactiontype_params
      params.require(:transactiontype).permit(:description)
    end
end