class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:index, :new, :create]

  def index
    @category = Category.find(params[:category_id])
    @transactions = @category.transaction_records.order(created_at: :desc)
    @total_amount = @transactions.sum(:amount)
  end

  def new
    @transaction = Transaction.new
    @categories = Category.all
  end

  def create
    @transaction = Transaction.new(transaction_params.except(:category_id))
    @transaction.author = current_user # or however you get the current user
  
    if @transaction.save
      CategoriesTransaction.create(transaction_ref_id: @transaction.id, category_id: params[:category_id])
      redirect_to category_transactions_path(params[:category_id])
    else
      puts @transaction.errors.full_messages
      @categories = Category.all
      render :new
    end
  end

  private

  def set_category
    @category = current_user.authored_categories.includes(:transaction_records).find(params[:category_id])
  end

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :author_id, :category_id)
  end
end