class Admin::RulesController < ApplicationController
  before_filter :require_login

  def new
    @rule = Rule.new
  end

  def create
    @rule = Rule.new(params[:rule])
    @rule.event_id = params[:event_id]

    if @rule.save
      redirect_to admin_event_teams_path, :notice => "Rule created!"
    else
      render :new
    end
  end

  def edit
    @rule = Rule.find(params[:id])
  end

  def update
    @rule = Rule.find(params[:id])
    if @rule.update_attributes(params[:rule])
     redirect_to admin_event_teams_path, :notice => "Rule updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @rule = Rule.find(params[:id])
    @rule.destroy
    redirect_to admin_event_teams_path, :notice => "Rule Deleted"
  end

end