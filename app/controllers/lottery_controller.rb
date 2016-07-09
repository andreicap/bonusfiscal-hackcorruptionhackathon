class LotteryController < ApplicationController
  skip_before_action :authenticate_citizen!, :only => [:index]
  before_action :set_tickets, :set_winners

  def index

  end

  def generate_winners
    winner_generator
  end

private

  def winner_generator

    ids = @tickets.ids
    ids_that_won = @winners.ids
    ids_pool = ids-ids_that_won
    if ids_pool.empty?
      flash[:notice] = "Tichetele s-au consumat"
      redirect_to '/lottery'
    else
      winner_id = (ids_pool).sample
      w = Winner.new
      w.ticket = @tickets.find(winner_id)
      w.save
      redirect_to '/lottery'
    end
  end

  def set_tickets
    @tickets = Ticket.all
  end

  def set_winners
    @winners = Winner.all
  end

end
