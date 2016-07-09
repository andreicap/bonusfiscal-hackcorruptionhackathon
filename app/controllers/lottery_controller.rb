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
    low_win_ids, medium_win_ids, high_win_ids = [], [], []

    ids_low = Ticket.select(:id).where(ticket_category: "low").ids
    ids_medium = Ticket.select(:id).where(ticket_category: "medium").ids
    ids_high = Ticket.select(:id).where(ticket_category: "high").ids

    @winners.each do |winner|
      if winner.ticket.ticket_category == "low"
        low_win_ids << winner.ticket_id
      elsif winner.ticket.ticket_category == "medium"
        medium_win_ids << winner.ticket_id
      else high_win_ids << winner.ticket_id
      end
    end

    select_winner_from_array  ids_low - low_win_ids, "low"
    select_winner_from_array  ids_medium - medium_win_ids, "medium"
    select_winner_from_array  ids_high - high_win_ids, "high"

    redirect_to '/lottery'
  end

  def set_tickets
    @tickets = Ticket.all
  end

  def set_winners
    @winners = Winner.all
  end

  def select_winner_from_array ids_pool, category
    if ids_pool.empty?
      flash[:notice] = "Tichetele de categoria #{category} s-au consumat"
      # redirect_to '/lottery'
    else
      winner_id = (ids_pool).sample
      w = Winner.new
      w.ticket = @tickets.find(winner_id)
      w.save
      # redirect_to '/lottery'
    end
  end

end
