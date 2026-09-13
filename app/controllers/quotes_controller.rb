class QuotesController < ApplicationController
    before_action :set_quote, only: %i[ show edit update destroy ]
    def index
        @quotes = Quote.all.ordered
    end

    def show
    end

    def new
        @quote = Quote.new
    end

    def create
        @quote = Quote.new(quote_params)

        if @quote.save
            respond_to do |format|
                format.html { redirect_to quotes_path, notice: "Quote was successfully created." }
                format.json { render :show, status: :created, location: @quote }
            end
        else
            respond_to do |format|
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @quote.errors, status: :unprocessable_entity }
            end
        end
    end

    def edit
    end

    def update
        if @quote.update(quote_params)
            respond_to do |format|
                format.html { redirect_to quotes_path, notice: "Quote was successfully updated." }
                format.json { render :show, status: :ok, location: @quote }
            end
        else
            respond_to do |format|
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @quote.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @quote.destroy
        respond_to do |format|
            format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private

    def set_quote
        @quote = Quote.find(params.expect(:id))
    end

    def quote_params
        params.expect(quote: [:name])
    end
end
