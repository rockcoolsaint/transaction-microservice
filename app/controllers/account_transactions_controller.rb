class AccountTransactionsController < ApplicationController
  before_action :set_transaction, only: [:show]

  def index
    @transactions = AccountTransaction.all

    render json: @transactions, status: :ok
  end

  def show
    render json: @transaction, status: :ok
  end
  
  def create
    @transaction = AccountTransaction.new(transaction_params)
    @transaction.output_amount = AccountTransaction.output_amount(params[:input_amount], params[:input_currency])
    
    if @transaction.save
      # "=====published to rabbitmq-server====="
      # Publisher.publish('transactions', @transaction.attributes)
      render json: @transaction, status: :created
    else
      render json: {message: "Something went wrong"}, status: :internal_server_error
    end
  end

  def update
    @transaction = AccountTransaction.find_by(id: params[:id])
    @transaction.update!(transaction_params)
    render json: @transaction, status: 200
  end
  
  private

  def set_transaction
    @transaction = AccountTransaction.find(params[:id])
  end

  def transaction_params
    params.permit(:user_id, :input_amount, :input_currency, :output_currency)
  end
  
end
