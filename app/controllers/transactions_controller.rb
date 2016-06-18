class TransactionsController < ApplicationController

  # Index action(i.g. 'my')
  def index
    @transactions = Transaction.all
  end

  def new
    @transaction = Transaction.new
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      redirect_to @transaction, notice: t('flash.notice.@transaction_created')
    else
      render :new
    end
  end

  def update
    @transaction = Transaction.find(params[:id])

    if @transaction.update(transaction_params)
      redirect_to @transaction, notice: 'Transação atualizada com sucesso'
    else
      render action: edit
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])  # Verificar necessidade
    @transaction.destroy
    redirect_to transactions_url
  end

  private
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    def transaction_params
      params.require(:transaction).permit(:product_id, :transactiontype_id, :amount, :product_price, :total_price)
    end
end