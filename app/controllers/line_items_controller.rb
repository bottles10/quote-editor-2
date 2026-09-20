class LineItemsController < ApplicationController 
  before_action :set_quote
  before_action :set_line_item_date
  before_action :set_line_item, only: %i[ edit update destroy ]

  def new
    @line_item = @line_item_date.line_items.new
  end

  def create
    @line_item = @line_item_date.line_items.new(line_item_params)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @quote, notice: "Item was successfully saved." }
        format.turbo_stream { flash.now[:notice] = "Item was successfully saved." }
        format.json { render json: @line_item, status: :created, location: @quote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @quote, notice: "Item was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Item was successfully updated." }
        format.json { render json: @line_item, status: :ok, location: @quote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to @quote, notice: "Item was successfully removed."}
      format.turbo_stream {flash.now[:notice] = "Item was successfuly removed." }
      format.json { head :no_content }
    end
  end
  



  private

  def set_quote
    @quote = current_company.quotes.find(params.expect(:quote_id))
  end

  def set_line_item_date
    @line_item_date = @quote.line_item_dates.find(params.expect(:line_item_date_id))
  end

  def set_line_item
    @line_item = @line_item_date.line_items.find(params.expect(:id))
  end

  def line_item_params
    params.expect(line_item: [ :name, :quantity, :unit_price, :description ])
  end
end