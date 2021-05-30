# frozen_string_literal: true

class IssuesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_issue, only: %i[toogle_published]

  def toogle_published
    @issue.toggle(:is_open).save
  end

  private

  def set_issue
    @issue = Issue.find(params[:id])
  end
end
