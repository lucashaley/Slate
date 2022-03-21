class LeaderboardsController < ApplicationController
  def show
    @top_ideas = Idea.top_by_comment_count
    @top_commenters = User.top_by_comment_count
    @top_ideators = User.top_by_idea_count
  end
end
