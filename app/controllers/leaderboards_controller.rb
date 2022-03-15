class LeaderboardsController < ApplicationController
  def show
    @top_ideas = Idea.last(2)
  end
end
