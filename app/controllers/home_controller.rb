class HomeController < ApplicationController
  def index
    @events = Event.all
    @match_results = []
    @match_fixtures = []
    @events.each do |event|
      @match_results << event.matches.result_not_nil
      @team_1 = []
      @team_2 = []
      @match_results.each do |match_result|
        match_result.each_with_index do |match|
          @team_1 << Team.find(match.t1)
          @team_2 << Team.find(match.t2)
        end
      end

      @match_fixtures << event.matches.where(:result => "nil")
      @team_one = []
      @team_two = []
      @match_fixtures.each do |match_fixture|
        match_fixture.each_with_index do |match|
          @team_one << Team.find(match.t1)
          @team_two << Team.find(match.t2)
        end
      end
    end

    @photos = Photo.all
    #code if we want to show all fixtures,results together

    #@match_results = Match.result_not_nil
    #@team_1 = []
    #@team_2 = []
    #@match_results.each do |match|
      #@team_1 << Team.find(match.t1)
      #@team_2 << Team.find(match.t2)
    #end
    #render :text => @matches.inspect and return false
    #@match_fixtures = Match.where(:result=> "nil")
    #@team_one = []
    #@team_two = []
    #@match_fixtures.each do |match|
      #@team_one << Team.find(match.t1)
      #@team_two << Team.find(match.t2)
    #end

  end
end
