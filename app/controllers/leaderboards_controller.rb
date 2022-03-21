class LeaderboardsController < ApplicationController
  def show
    # comments_count
    # @top_ideas = Idea.all.order_by_comment_count.limit(10)
    @top_ideas = Idea.top_by_comment_count
    # @top_users = User.all.order_by_comment_count.limit(10)
    # @top_users = User.top_by_comment_count
    # @top_users = User.order_by_comment_count
    @top_users = User.order('comments_count DESC').limit(10)
  end
end
