class LineItemDatesController < ApplicationController
  before_action :set_quote
  before_action :set_line_item_date, only: %i[ edit update destroy ]

  def new
    @line_item_date = @quote.line_item_dates.new
  end

  def create
    @line_item_date = @quote.line_item_dates.new(line_item_date_params)

    respond_to do |format|
      if @line_item_date.save
        format.html { redirect_to @quote, notice: "Date created successfully." }
        format.turbo_stream { flash.now[:notice] = "Date created successfully." }
        format.json { render json: @line_item_date, status: :created, location: @quote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render @line_item_date.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @line_item_date.update(line_item_date_params)
        format.html { redirect_to @quote, notice: "Date was updated successfully." }
        format.turbo_stream { flash.now[:notice] = "Date was updated successsfully." }
        format.json { render json: @line_item_date, status: :ok, location: @quote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @line_item_date.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @line_item_date.destroy
    
    respond_to do |format|
      format.html { redirect_to @quote, notice: "Date was successfully deleted." }
      format.turbo_stream { flash.now[:notice] = "Date was successfully deleted." }
      format.json { head :no_content }
    end
  end
  

  private

  def set_quote
    @quote = current_company.quotes.find(params.expect(:quote_id))
  end

  def set_line_item_date
    @line_item_date = @quote.line_item_dates.find(params.expect(:id))
  end

  def line_item_date_params
    params.expect(line_item_date: [ :date ])
  end
end